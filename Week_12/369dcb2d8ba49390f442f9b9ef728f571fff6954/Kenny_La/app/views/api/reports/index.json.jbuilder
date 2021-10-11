@reports.each do |report|
  json.set! report.id do
    json.partial! 'report', report: report
  end
end
