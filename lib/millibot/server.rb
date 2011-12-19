require 'sinatra/base'
require 'slim'

module Millibot
  class Server < Sinatra::Base
    configure :development do
      # Do some configs
      Slim::Engine.set_default_options :pretty => true
    end
    # config_path = File.join(File.dirname(__FILE__), "..", "config.ru")
    dir = File.dirname(File.expand_path(__FILE__))

    set :views,  "#{dir}/server/views"

    if respond_to? :public_folder
      set :public_folder, "#{dir}/server/public"
    else
      set :public, "#{dir}/server/public"
    end

    set :static, true

    helpers do
      include Rack::Utils
      alias_method :h, :escape_html

    #   def current_section
    #     url_path request.path_info.sub('/','').split('/')[0].downcase
    #   end
    # 
    #   def current_page
    #     url_path request.path_info.sub('/','')
    #   end
    # 
    #   def url_path(*path_parts)
    #     [ path_prefix, path_parts ].join("/").squeeze('/')
    #   end
    #   alias_method :u, :url_path
    # 
    #   def path_prefix
    #     request.env['SCRIPT_NAME']
    #   end
    # 
    #   def class_if_current(path = '')
    #     'class="current"' if current_page[0, path.size] == path
    #   end
    end
    
    get '/' do
      slim :home
    end
    
    message = <<-start_message.gsub(/^ {8}/, '')
    
    ###########################################################
    #
    #   Using Ghoul via the "ghoul server" command is
    #   insecure by default. It is only intended for a secure
    #   local environment e.g. behind a firewall where only you
    #   or people you trust can access your machine on a lan.
    #
    #############################################################
    
    Starting service on http://0.0.0.0:3003

    start_message
    
    # puts message
    
    # ENV['RACK_ENV'] = "production"
    # Rack::Server.new(:config => config_path, :Port => 3003).start
    
    # Open the users browser to our new server
    # system("open http://0.0.0.0:3003")
  
  end  
end
