# Defines additional parameter structures.
module Params
  # Manages a set of sort clauses.
  # @attr [Array<Params::Sort::Clause>] clauses The sort clauses used to order a collection.
  class Sort
    attr_reader :clauses

    # Creates a new +Params::Sort+
    #
    # @param [Array<Params::Sort::Clause>] clauses The sort clauses used to order a collection.
    # @return [Params::Sort]
    def initialize(clauses)
      @clauses = clauses
    end

    # Converts a collection of clauses into a formatted string by
    # calling +to_s+ on all clauses and joining them with a comma.
    #
    # @example Convert to string
    #   sort = Params::Sort.parse('name:asc,age:desc')
    #   sort.to_s # => "name ASC, age DESC"
    def to_s
      clauses.join(', ')
    end

    # Converts a sort parameter string and converts an instance of +Params::Sort+. Grape uses this
    # method automatically. It raises an exception to indicate the value was invalid.
    #
    # @example Parsing a query parameter
    #   Params::Sort.parse('name:asc,age:desc') # =>
    #   <Sort @clauses=[#<Sort::Clause @direction="ASC", @property="name">,
    #                   <Sort::Clause @direction="DESC", @property="age">]>
    # @todo Add an example for the invalid case
    #
    # @param [String] query_parameter A comma-separated list of sort clauses.
    # @return [Params::Sort]
    def self.parse(query_parameter)
      # TODO: fail if regex validation is incorrect

      clauses = query_parameter.split(',')

      clauses.map! do |clause|
        Clause.new(*clause.split(':'))
      end

      new(clauses)
    end

    # A sort clause. It holds the sort expression and sort direction.
    #
    # @attr [String] expression The expression to sort.
    # @attr [String] direction The sort direction. It can be +'ASC'+ or +'DESC'+
    class Clause
      attr_accessor :expression, :direction

      # Creates a new +Clause+
      #
      # @param [String] expression The expression to sort
      # @param [String] direction The sort direction. It can be +'ASC'+ or +'DESC'+
      # @return [Clause]
      def initialize(expression, direction)
        @expression = expression
        @direction = direction.upcase
      end

      # Formats the sort clause as string.
      #
      # @example Convert to string
      #   clause = Clause.new('name', 'ASC')
      #   clause.to_s # => 'name, ASC'
      #
      # @return [String]
      def to_s
        "#{expression} #{direction}"
      end
    end
  end
end
