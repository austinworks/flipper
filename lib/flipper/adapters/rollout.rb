module Flipper
  module Adapters
    class Rollout
      # Public: The name of the adapter.
      attr_reader :name

      def initialize(rollout)
        @rollout = rollout
        @name = :rollout
      end

      # Public: The set of known features.
      def features
        @rollout.features
      end

      # Public: Gets the values for all gates for a given feature.
      #
      # Returns a Hash of Flipper::Gate#key => value.
      def get(feature)
        feature = @rollout.get(feature.key)
        percentage = feature.percentage.zero? ? nil : feature.percentage
        {
          boolean: nil,
          groups: Set.new(feature.groups),
          actors: Set.new(feature.users),
          percentage_of_actors: percentage,
          percentage_of_time: nil,
        }
      end

      def get_multi(features)
      end

      def get_all
      end

      def add(_feature)
      end

      def remove(_feature)
      end

      def clear(_feature)
      end

      def enable(_feature, _gate, _thing)
      end

      def disable(_feature, _gate, _thing)
      end

      def import(_source_adapter)
      end
    end
  end
end
