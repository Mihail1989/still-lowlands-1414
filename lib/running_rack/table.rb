require 'json'
require 'active_support/core_ext/hash/slice'
require 'terminal-table'
module RunningRack
  class Table

    HEADINGS = ['District', 'Address', 'HelpPhone', 'ObjectHasWifi']

    attr_reader :rows

    def initialize data
      @rows = prepare data
    end

    def print
      @table ||= create_table
      #puts @table
    end


    private

    def prepare data
      JSON.parse(data.read).map! do |row|
        row['Cells'].slice(*HEADINGS).values
      end
    end

    def create_table
      sep_rows = @rows.zip(Array.new(@rows.count - 1){ :separator }).flatten(1).compact
      Terminal::Table.new rows: sep_rows, headings: HEADINGS
    end

  end
end