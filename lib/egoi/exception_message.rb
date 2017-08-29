# encoding: utf-8
module Egoi
  class ExceptionMessage

    def initialize(error_code)
      @message = self.class.error_messages[error_code]
    end

    def message
      @message
    end

    def self.error_messages
      @error_messages ||= {
        "CANNOT_BE_DELETED" => "A campanha é recorrente ou activada por evento e não pode ser eliminada por API",
        "ALREADY_DELETED" => "A campanha já foi deletada",
        "CAMPAIGN_NOT_FOUND" => "A campanha não existe",
        "CANNOT_EDIT_CAMPAIGN" => "A campanha não pode ser editada neste momento (pode estar sendo enviada ou num estado que impossibilite a edição)",
        "CAMPAIGN_NOT_VALID" => "A campanha ou modelo de campanha não é válida",
        "BIRTH_DATE_ALREADY_EXISTS" => "A data de nascimento já existe na lista",
        "LIST_NOT_FOUND" => "A lista de distribuição não existe",
        "NO_ACCESS" => "Api key não definida ou permissão negada para realizar esta ação",
        "BIRTH_DATE_REQUIRED" => "Data de nascimento não definida",
        "LIST_MISSING" => "Lista de email não definida",
        "NO_MESSAGE" => "Conteúdo de mensagens de campanha não definidos.",
        "NO_PASSWORD" => "Senha não definida",
        "FIELD_NAME_MISSING" => "Nome do campo extra não definido",
        "NO_SUBSCRIBERS" => "Assinantes não encontrados para envio de sms",
        "NO_COMPARE_FIELD" => "Campos de comparação não definidos",
        "INVALID_FROM" => "Código do remetente não definido, ou incorreto ou ainda não validado pelo E-Goi",
        "NO_FAX_FILE" => "Arquivo faz não definido",
        "NO_AUDIO_FILE" => "Arquivo de áudio não definido",
        "NO_SUBJECT" => "Titulo da campanha ou E-mail do destinatário não definidos",
        "NO_USERNAME" => "Usuário não definido",
        "NO_USERNAME_AND_PASSWORD" => "Usuário e senha não definidos",
        "SEGMENT_NAME_MISSING" => "Nome de segmento não definido",
        "NO_CELLPHONE_OR_TELEPHONE" => "Número de celular ou telefone não definidos",
        "FIRST_NAME_REQUIRED" => "Primeiro nome não definido",
        "SUBSCRIBER_MISSING" => "E-mail ou número de referencia do assinante não definidos",
        "TELEPHONE_REQUIRED" => "Telefone não definido",
        "EMAIL_REQUIRED" => "E-mail não definido",
        "NO_CAMPAIGN" => "Hash da campanha não definidos",
        "LAST_NAME_REQUIRED" => "Sobrenome não definido",
        "NO_SEARCH_FIELDS" => "Faltam os campos em que a pesquisa vai ser feita",
        "CANNOT_ADD_MORE_SUBSCRIBERS" => "Não é possível adicionar mais assisnantes porque o limite foi atingido",
        "INVALID_URL" => "Não foi possível carregar o conteúdo do URL",
        "NO_DATA_TO_INSERT" => "Não foram introduzidos quaisquer dados",
        "INVALID_FILE" => "O arquivo não é um pdf",
        "FILE_TOO_LARGE" => "O arquivo tem mais de 8 MB",
        "FIELD_NOT_FOUND" => "O campo extra não foi encontrado",
        "EXTRA_FIELD_XX_ALREADY_EXISTS" => "O campo extra X já existe na lista",
        "FAX_ALREADY_EXISTS" => "O fax introduzido já existe na lista",
        "INVALID" => "O nome de usuário não é válido",
        "FIST_NAME_ALREADY_EXISTS" => "O primeiro nome já existe na lista",
        "SEGMENT_NOT_FOUND" => "O segmento da lista de distribuição não existe",
        "LAST_NAME_ALREADY_EXISTS" => "O sobrenome já existe na lista",
        "SUBSCRIBER_ALREADY_REMOVED" => "Assinante removido",
        "SUBSCRIBER_NOT_FOUND" => "O assinante não existe",
        "TELEPHONE_ALREADY_EXISTS" => "O telefone já existe na lista",
        "INVALID_TYPE" => "O tipo de campo extra não é válido",
        "EMAIL_ALREADY_EXISTS" => "O e-mail já existe",
        "EMAIL_ADDRESS_INVALID_DOESNT_EXIST" => "O e-mail não existe",
        "EMAIL_ADDRESS_INVALID" => "O e-mail é inválido",
        "EMAIL_ADDRESS_INVALID_MX_ERROR" => "O e-mail introduzido tem um erro nos registos MX",
        "INTERNAL_ERROR" => "Ocorreu um problema no servidor",
        "NO_USERNAME_AND_PASSWORD_AND_APIKEY" => "Não foi especificado nenhum usuário/senha ou apikey",
      }
    end
  end
end
