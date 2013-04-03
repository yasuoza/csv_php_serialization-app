module PhpSerializer
  class App < Padrino::Application
    use ActiveRecord::ConnectionAdapters::ConnectionManagement
    register Padrino::Rendering
    register Padrino::Mailer
    register Padrino::Helpers
    helpers Sprockets::Helpers

    get :index do
      render :index
    end

    put :upload , provides: [:html, :js] do
      if file = params[:file]
        return 403 unless file[:type] == 'text/csv'
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
  end
end
