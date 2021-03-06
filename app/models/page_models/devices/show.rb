module PageModels
  module Devices
    class Show
      def initialize(device)
        @device = device
      end

      def edit_device_path
        "/devices/#{@device.id}/edit"
      end

      def maintainers
        @device.maintainers.map{|maintainer| {:name => maintainer.name, :delete_path => "/devices/#{@device.id}/maintainers/#{maintainer.id}"}}
      end

      def name
        @device.name
      end

      def new_maintainer_path
        "/devices/#{@device.id}/maintainers/new"
      end

      def reference_url
        @device.reference_url.blank? ? nil : @device.reference_url
      end

      def reference_url_text
        @device.reference_url.blank? ? '(not set)' : @device.reference_url
      end

      def status
        @device.status ? @device.status.name : '(not set)'
      end

      def tag
        '(tag)'
      end
    end
  end
end
