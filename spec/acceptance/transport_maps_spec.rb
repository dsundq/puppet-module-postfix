# frozen_string_literal: true

require 'spec_helper_acceptance'

describe 'postfix with transport_maps set' do
  pp = <<-MANIFEST
    if $facts['os']['family'] == 'RedHat' {
      class { 'postfix':
        main_inet_protocols => 'ipv4',
        main_transport_maps => '/etc/postfix/transport',
        transport_maps      => {
          'test@test.ing' => 'test.ing',
        },
      }
    } else {
      class { 'postfix':
        main_transport_maps => '/etc/postfix/transport',
        transport_maps      => {
          'test@test.ing' => 'test.ing',
        },
      }
    }
  MANIFEST

  it 'applies the manifest without errors' do
    apply_manifest(pp, catch_failures: true)
  end

  it 'is idempotent' do
    apply_manifest(pp, catch_changes: true)
  end

  describe service('postfix') do
    it { is_expected.to be_enabled }
    it { is_expected.to be_running }
  end

  describe port(25) do
    it { is_expected.to be_listening.with('tcp') }
  end

  describe file('/etc/postfix/transport') do
    it { is_expected.to exist }
    it { is_expected.to be_file }
    it { is_expected.to be_mode 644 }
    it { is_expected.to be_owned_by 'root' }
    it { is_expected.to be_grouped_into 'root' }
    its(:content) { is_expected.to match %r{test@test\.ing\s*test\.ing} }
  end

  describe file('/etc/postfix/transport.db') do
    it { is_expected.to exist }
  end
end
