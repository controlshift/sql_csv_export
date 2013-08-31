require 'query'
require 'export'

module SqlCsvExport
  
  def streaming_csv_export(export)
    filename = "#{export.name}-#{Time.now.strftime("%Y%m%d")}.csv"

    self.response.headers['Content-Type'] = 'text/csv'
    self.response.headers['Last-Modified'] = Time.now.ctime.to_s
    self.response.headers['Content-Disposition'] = "attachment; filename=#{filename}"
    self.response_body = export.as_csv_stream
  end

end