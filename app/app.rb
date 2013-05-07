module PhpSerializer
  class App < Padrino::Application
    use ActiveRecord::ConnectionAdapters::ConnectionManagement
    register Padrino::Rendering
    register Padrino::Mailer
    register Padrino::Helpers
    register SprocketsInitializer unless Padrino.env == :production
    helpers Sprockets::Helpers

    get :index do
      render :index
    end

    put :upload , provides: [:html, :js] do
      if file = params[:file]
        # Macintosh gives us file type as 'text/csv'
        # Windows gives us file type as 'application/octet-stream'
        return 403 unless file[:type] == 'text/csv' || file[:type] == 'application/octet-stream'
        file_content = File.open(file[:tempfile], external_encoding: 'cp932', internal_encoding: 'utf-8').read
        @result = SerializeBuilder.build!(file_content)
      end

      case content_type
      when :html
        render :result
      when :json
        JSON.generate({serializedText: @result})
      end
    end

    post :download do
      serialized_text = params[:serialized_text]
      csv_file_name = params[:csv_filename]
      attachment csv_file_name.sub('.csv', '.serialized')
      serialized_text.gsub(/\r\n?/, "\n")
    end
  end
end
