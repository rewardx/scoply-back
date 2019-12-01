module Report
  module Process
    module Trends
      # Params adaptation for recommendations
      class ParamsAdapter < Report::Process::Shared::ParamsAdapterBase
        STEPS = %i[
          ensure_filters_structure_existance
          ensure_period_group
        ].freeze

        def adapt
          STEPS.each { |m| send m }
          params
        end

        protected

        def ensure_filters_structure_existance
          params[:filters] ||= {}
          params[:filters][:data] ||= []
          params[:filters][:rows] ||= []
          params[:split] = :presence
          params[:order] ||= { desc: true }
          params[:order][:on] = 'name.0' # Use to cancel ordering based on cols value
        end

        def ensure_period_group
          params[:periods][0][:group] ||= 'day'
        end

        def data_filters
          params[:filters][:data]
        end

        def rows_filter
          params[:filters][:rows]
        end
      end
    end
  end
end
