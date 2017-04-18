require 'daru'

module ThinkStatsRuby
  class StataHelper
    def self.read_stata_file(dct_file_path, data_file_path, as_dataframe = false)
      spec = parse_spec(dct_file_path)
      frame = parse_data(spec, data_file_path)
      as_dataframe ? frame.as_dataframe : frame
    end

    def self.parse_spec(dct_file_path)
      specs = StataSpec.new

      File.foreach(dct_file_path) do |line|
        specs.add_column_spec(line)
      end

      specs
    end

    def self.parse_data(spec, data_file_path)
      table = StataTable.new(spec)

      File.foreach(data_file_path) do |line|
        table.add_from_line(line)
      end

      table
    end
  end

  class StataSpec
    attr_accessor :specs

    def initialize
      @specs = []
    end

    def add_column_spec(line)
      col_spec = make_col_spec(line)
      col_spec && @specs << col_spec
    end

    # def specs
    #   @specs.sort_by { |spec| spec[0] }
    # end

    private

    def make_col_spec(line)
      start_col = line[/_column\((\d+)\)/, 1]
      return if start_col == nil

      start_col = Integer(start_col) - 1
      type, name, format_str, *desc = line.split[1..-1]

      len = format_str[/(\d+)/, 1].to_i
      end_col = start_col + len

      desc = desc.join(" ").tr("\"", "")

      type_func = get_type_cast_func(type)

      [start_col, end_col, type_func, name, format_str, desc]
    end

    def get_type_cast_func(type)
      case type
      when /str/
        :to_s
      when /(double|float)/
        :to_f
      when /(byte|int)/
        :to_i
      end
    end
  end

  class StataTable
    attr_reader :headers, :specs
    attr_accessor :data

    def initialize(specs)
      @specs = specs
      @headers = specs.specs.map { |spec| spec[3] }
      @data = Hash[@headers.each_with_object(nil).to_a]
    end

    def add_from_line(line)
      @specs.specs.each do |spec|
        start_col, end_col = spec[0..1]
        spec_type, spec_name = spec[2..3]

        spec_data = line[start_col...end_col]
        update(spec_name, spec_data.strip.send(spec_type))
      end
    end

    def update(header, data)
      @data[header] ||= []
      @data[header] << data
    end

    def as_dataframe
      Daru::DataFrame.new(@data)
    end
  end
end
