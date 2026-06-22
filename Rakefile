# frozen_string_literal: true

begin
  require 'voxpupuli/test/rake'
rescue LoadError
  begin
    require 'puppetlabs_spec_helper/rake_tasks'
  rescue LoadError
    # Neither available - acceptance-only run
  end
end

begin
  require 'voxpupuli/acceptance/rake'
rescue LoadError
  # voxpupuli-acceptance not available
end

begin
  require 'puppet-strings/tasks'
rescue LoadError
  # puppet-strings not available
end
