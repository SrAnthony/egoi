# encoding: utf-8

class Egoi::EgoiException

  def initialize(error_code)
    @message = self.class.error_messages[error_code]
  end

  def message
    @message
  end

  def self.error_messages
    @error_messages ||= {
      "CANNOT_BE_DELETED" => "A campanha é recorrente ou activada por evento e não pode ser eliminada por API",
      "ALREADY_DELETED" => "A campanha já foi eliminada",
      "CAMPAIGN_NOT_FOUND" => "A campanha não existe",
      "CANNOT_EDIT_CAMPAIGN" => "A campanha não pode ser editada neste momento (pode estar sendo enviada ou num estado que impossibilite a edição)",
      "CAMPAIGN_NOT_VALID" => "A campanha ou modelo de campanha não é válida",
      "BIRTH_DATE_ALREADY_EXISTS" => "A data de nascimento introduzida já existe na lista",
      "LIST_NOT_FOUND" => "A lista de distribuição não existe",
      "MESSAGE_TO_LONG" => "A mensagem tem mais que 160 caracteres",
      "MESSAGE_TOO_LONG" => "A mensagem tem mais que 160 caracteres",
      "NO_ACCESS" => "Falta a chave da API ou faltam permissões de acesso à lista",
      "BIRTH_DATE_REQUIRED" => "Falta a data de nascimento",
      "LIST_MISSING" => "Falta a lista de distribuição",
      "NO_MESSAGE" => "Falta a mensagem",
      "NO_PASSWORD" => "Falta a palavra-passe",
      "SUBSCRIBER_MISSING" => "Falta a referência do subscritor",
      "NO_PASSWORD" => "Falta a palavra-passe",
      "FIELD_NAME_MISSING" => "Falta dar um nome ao campo extra",
      "SEGMENT_NAME_MISSING" => "Falta dar um nome ao segmento",
      "LIST_MISSING" => "Falta definir a lista",
      "NO_SUBSCRIBERS" => "Falta definir os contactos a importar",
      "NO_COMPARE_FIELD" => "Falta definir um campo de comparação",
      "NO_ZIP_FILE" => "Falta o arquivo ZIP com o conteúdo do e-mail",
      "NO_SUBJECT" => "Falta o assunto",
      "INVALID_FROM" => "Falta o código do remetente (ou está incorrecto) ou o remetente ainda não foi validado no E-goi",
      "NO_MESSAGE" => "Falta o conteúdo do e-mail a enviar (não foi fornecido por arquivo ZIP ou por URL)",
      "FAX_REQUIRED" => "Falta o fax",
      "NO_FAX_FILE" => "Falta o ficheiro com o fax",
      "NO_AUDIO_FILE" => "Falta o ficheiro de áudio",
      "NO_SUBJECT" => "Falta o nome da campanha",
      "NO_USERNAME" => "Falta o nome de utilizador",
      "NO_USERNAME_AND_PASSWORD" => "Falta o nome de utilizador e a palavra-passe",
      "NO_USERNAME" => "Falta o nome de usuário",
      "SEGMENT_NAME_MISSING" => "Falta o nome do segmento",
      "NO_CELLPHONE_OR_TELEPHONE" => "Falta o número de celular ou telefone",
      "FIRST_NAME_REQUIRED" => "Falta o primeiro nome",
      "SUBSCRIBER_MISSING" => "Falta o subscritor",
      "TELEPHONE_REQUIRED" => "Falta o telefone",
      "EMAIL_REQUIRED" => "Falta o e-mail",
      "NO_CAMPAIGN" => "Falta o hash da campanha",
      "LAST_NAME_REQUIRED" => "Falta o sobrenome",
      "NO_SEARCH_FIELDS" => "Faltam os campos em que a pesquisa vai ser feita",
      "CANNOT_ADD_MORE_SUBSCRIBERS" => "Não é possível adicionar mais subscritores porque foi atingido o limite",
      "SUBSCRIBER_DATA_CANNOT_BE_EDITED" => "Não é possível editar os dados do subscritor porque o subscritor já foi removido",
      "NO_SEGMENTS_FOUND" => "Não foi encontrado nenhum segmento",
      "INVALID_URL" => "Não foi possível carregar o conteúdo do URL",
      "NO_DATA_TO_INSERT" => "Não foram introduzidos quaisquer dados",
      "INVALID_FILE" => "O arquivo ZIP importado não é válido",
      "FILE_TOO_LARGE" => "O arquivo ZIP tem mais de 8 MB",
      "FIELD_NOT_FOUND" => "O campo extra não foi encontrado",
      "EXTRA_FIELD_XX_ALREADY_EXISTS" => "O campo extra X já existe na lista",
      "FAX_ALREADY_EXISTS" => "O fax introduzido já existe na lista",
      "INVALID_FILE" => "O ficheiro de áudio não é válido ou não se encontra no formato correcto",
      "FILE_TOO_LARGE" => "O ficheiro de fax tem mais que 8 MB",
      "INVALID" => "O nome de utilizador não é válido",
      "FIST_NAME_ALREADY_EXISTS" => "O primeiro nome introduzido já existe na lista",
      "SEGMENT_NOT_FOUND" => "O segmento da lista de distribuição não existe",
      "LAST_NAME_ALREADY_EXISTS" => "O sobrenome introduzido já existe na lista",
      "SUBSCRIBER_ALREADY_REMOVED" => "O subscritor já foi removido",
      "SUBSCRIBER_NOT_FOUND" => "O subscritor não existe",
      "TELEPHONE_ALREADY_EXISTS" => "O telefone introduzido já existe na lista",
      "INVALID_TYPE" => "O tipo de campo extra não é válido",
      "EMAIL_ALREADY_EXISTS" => "O e-mail introduzido já existe",
      "EMAIL_ADDRESS_INVALID_DOESNT_EXIST" => "O e-mail introduzido não existe",
      "EMAIL_ADDRESS_INVALID" => "O e-mail introduzido tem um erro de sintaxe",
      "EMAIL_ADDRESS_INVALID_MX_ERROR" => "O e-mail introduzido tem um erro nos registos MX",
      "INTERNAL_ERROR" => "Ocorreu um problema no servidor",
      "NO_USERNAME_AND_PASSWORD_AND_APIKEY" => "Não foi especicado nenhum utilizador/password ou apikey",
    }
  end
end
