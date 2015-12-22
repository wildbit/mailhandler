require 'spec_helper'

describe MailHandler::Sending::SMTPSender do

  subject { MailHandler::Sending::SMTPSender }

  context '.send' do

    context 'invalid' do

      it 'incorrect mail type' do

        sender = subject.new
        expect { sender.send('Test') }.to raise_error MailHandler::TypeError

      end

      it 'incorrect auth' do

        sender = subject.new
        expect { sender.send(Mail.read_from_string(File.read "#{data_folder}/email1.txt")) }.to raise_error Errno::ECONNREFUSED

      end

    end

  end

end