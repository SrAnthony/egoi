require "xmlrpc/client"

class Egoi::XmlRpc
  attr_accessor :apikey, :client, :proxy

  def initialize(args = {})
    options = {
      url: 'http://api.e-goi.com/v2/xmlrpc.php',
    }.merge(args)
    @apikey = options[:apikey]
    uri = URI.parse(options[:url])
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

  private

  def call(method_name, *args)
    limit = 3
    begin
      return proxy.send(method_name, merge_defaults(args))
    rescue EOFError
      ex_counter = (ex_counter ||= 0) + 1
      retry if ex_counter < limit
    end
  end

  def merge_defaults(arguments)
    if apikey
      { apikey: apikey }.merge(arguments.first || {})
    else
      arguments
    end
  end
end
