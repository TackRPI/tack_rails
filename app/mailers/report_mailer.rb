class ReportMailer < ApplicationMailer

  def send_report(pdf_file)
    attachments['report.pdf'] = pdf_file # File.read('path/to/file.pdf')
    mail( to: 'aeksco@gmail.com', subject: 'Cortical Metrics Reporting' )
  end

end
