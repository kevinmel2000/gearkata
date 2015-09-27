module GearListUrl
  extend self

  def for(gear_list, request_host, request_port = nil)
    port_str = ":#{request_port}" if request_port

    "http://#{request_host}#{port_str}/#{gear_list.uuid}"
  end
end
