module Fluent
    class ConvertOutput < Output
        Fluent::Plugin.register_output("convert", self)
        config_param :tag   , :string, :default => nil

        def emit(tag, es, chain)
            es.each do |time, record|
                converted = convert_record(record)
                Engine.emit(@tag, time, converted)
            end
            chain.next
        end

        def convert_record(record)
          key      = record.has_key?('key')      ? record['key']      : 'key'
          value    = record.has_key?('value')    ? record['value']    : 'value'
          type     = record.has_key?('type')     ? record['type']     : 'type'
          hostname = record.has_key?('hostname') ? record['hostname'] : 'hostname'
          id       = record.has_key?('id')       ? record['id']       : 'id'
          name     = record.has_key?('name')     ? record['name']     : 'name'
          {hostname => {id => { key => value}}}
        end
    end
end
