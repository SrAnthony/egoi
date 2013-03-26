require "xmlrpc/client"

class Egoi::XmlRpc
  attr_accessor :apikey, :client, :proxy

  def initialize(args = {})
    options = {
      url: 'http://api.e-goi.com/v2/xmlrpc.php',
      friendly_messages: true
    }.merge(args)
    @apikey = options[:apikey]
    uri = URI.parse(options[:url])
    @friendly_messages = options[:friendly_messages]
    @client = XMLRPC::Client.new(uri.host, uri.path)
    @proxy = @client.proxy
  end

  def api_method?(name)
    api_methods.include? name.to_sym
  end

  def method_missing(method_name, *args, &block)
    if api_method?(method_name)
      call(method_name, *args, &block)
    else
      super
    end
  end


  def respond_to?(method_name, include_private = false)
    api_method?(method_name) || super
  end

  def api_methods
    @api_methods ||= [
      :getLists,
      :addExtraField,
      :addSubscriber,
      :addSubscriberBulk,
      :checklogin,
      :createCampaignEmail,
      :createCampaignFAX,
      :createCampaignSMS,
      :createCampaignVoice,
      :createList,
      :createSegment,
      :deleteCampaign,
      :deleteSegment,
      :editCampaignEmail,
      :editCampaignSMS,
      :editExtraField,
      :editSubscriber,
      :getCampaigns,
      :getClientData,
      :getCredits,
      :getReport,
      :getSegments,
      :getSenders,
      :getUserData,
      :removeSubscriber,
      :sendCall,
      :sendEmail,
      :sendFAX,
      :sendSMS,
      :subscriberData,
      :updateList
    ]
  end

  def friendly_messages?
    @friendly_messages
  end

  private

  def retrying_call(method_name, args)
    limit = 3
    begin
      return proxy.send(method_name, args)
    rescue EOFError
      ex_counter = (ex_counter ||= 0) + 1
      retry if ex_counter < limit
    end
  end

  def call(method_name, *args)
    result = retrying_call(method_name, merge_defaults(args))
    if friendly_messages? && String === result && (error_message = Egoi::EgoiException.new(result).message)
      return error_message
    end
    result
  end

  def merge_defaults(arguments)
    if arguments.is_a?(Hash)
      if apikey
        { apikey: apikey }.merge(arguments)
      else
        arguments
      end
    elsif arguments.is_a?(Array) && arguments.size <= 1
      if apikey
        { apikey: apikey }.merge(arguments.first || {})
      else
        arguments.first || {}
      end
    else
      arguments
    end
  end
end
