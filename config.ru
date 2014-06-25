require 'faye'
require 'thin'

# Tune EM for better concurrency
EM.set_descriptor_table_size 500_000
EM.set_max_timers 500_000
EM.epoll

# Output debug if enabled
Faye.logger = method(:puts)


# Start faye
Faye::WebSocket.load_adapter('thin')
bayeux = Faye::RackAdapter.new mount: '/faye', timeout: 3
run bayeux
