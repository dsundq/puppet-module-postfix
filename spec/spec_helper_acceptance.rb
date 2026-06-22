# frozen_string_literal: true

require 'voxpupuli/acceptance/spec_helper_acceptance'

configure_beaker do |host|
  # Install iproute for ss command on EL-based systems
  install_package(host, 'iproute') if fact_on(host, 'os.family') == 'RedHat'
end
