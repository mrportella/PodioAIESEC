require_relative '../control/podio_app_control'
require_relative '../enums'

class App1Inscritos < PodioAppControl

  def initialize(app_id)
    super(app_id)
    @fields = {:nome => 'title',
               :sexo => 'sexo',
               :data_nascimento => 'data-de-nascimento',
               :telefone => 'telefone',
               :celular => 'celular',
               :operadora => 'category',
               :email => 'e-mail',
               :endereco => 'endereco',
               :cep => 'cep',
               :cidade => 'cidade',
               :estado => 'relationship',
               :formacao => 'category-2',
               :curso => 'curso',
               :semestre => 'semestre',
               :faculdade => 'faculdade',
               :ingles => 'nivel-de-ingles',
               :espanhol => 'nivel-de-espanhol',
               :entidade => 'relationship-2',
               :turno => 'melhor-turno-para-a-aiesec-entrar-em-contato',
               :programa_interesse => 'programa-de-interesse',
               :como_conheceu_aiesec => 'como-conheceu-a-aiesec',
               :pessoa_que_indiciou => 'nome-da-pessoa-que-te-indicou',
               :voluntario_ferias => 'voce-esta-se-inscrevendo-especificamente-para-o-program',
               :vaga_especifica => 'caso-voce-esteja-se-candidatando-a-algum-projetovaga-es',
               :responsavel => 'responsavel-local',
               :abordado => 'foi-abordado'}
  end

  def nome_completo(index)
    i = get_field_index_by_external_id(index, @fields[:nome])
    fields(index, i).to_s unless i.nil?
  end

  def set_nome_completo(param)
    @nome = param.to_s
  end

  def sexo(index)
    i = get_field_index_by_external_id(index, @fields[:sexo])
    $enum_sexo.key(fields(index, i)['id'].to_i) unless i.nil?
  end

  def set_sexo(param)
    @sexo = $enum_sexo[param]
  end

  def data_nascimento(index)
    i = get_field_index_by_external_id(index, @fields[:data_nascimento])
    DateTime.strptime(@item[0][0][:fields][i]['values'][0]['start_date'] + ' 00:00:00','%Y-%m-%d %H:%M:%S') unless i.nil?
  end

  def set_data_nascimento(param)
    @data_nascimento = param.strftime('%Y-%m-%d %H:%M:%S')
  end

  def set_data_nascimento_format(year,month,day,hour,minute,second)
    @data_nascimento = DateTime.new(year,month,day,hour,minute,second).strftime('%Y-%m-%d %H:%M:%S')
  end

  def telefone(index)
    i = get_field_index_by_external_id(index, @fields[:telefone])
    fields(index, i).to_s.gsub!(/[^0-9]/,'') unless i.nil?
  end

  def set_telefone(param)
    param.gsub!(/[^0-9]/,'')
    @telefone = param
  end

  def celular(index)
    i = get_field_index_by_external_id(index, @fields[:celular])
    fields(index, i).to_s.gsub!(/[^0-9]/,'') unless i.nil?
  end

  def set_celular(param)
    param.gsub!(/[^0-9]/,'')
    @celular = param
  end

  def operadora(index)
    i = get_field_index_by_external_id(index, @fields[:operadora])
    $enum_operadora.key(fields(index, i)['id'].to_i) unless i.nil?
  end

  def set_operadora(param)
    @operadora = $enum_operadora[param]
  end

  def email(index)
    i = get_field_index_by_external_id(index, @fields[:email])
    fields(index, i).to_s unless i.nil?
  end

  def set_email(param)
    @email = param
  end

  def endereco(index)
    i = get_field_index_by_external_id(index, @fields[:endereco])
    fields(index, i).to_s unless i.nil?
  end

  def set_endereco(param)
    @endereco = param
  end

  def cep(index)
    i = get_field_index_by_external_id(index, @fields[:cep])
    fields(index, i).to_s unless i.nil?
  end

  def set_cep(param)
    @cep = param
  end

  def cidade(index)
    i = get_field_index_by_external_id(index, @fields[:cidade])
    fields(index, i).to_s unless i.nil?
  end

  def set_cidade(param)
    @cidade = param
  end

  def estado_id(index)
    i = get_field_index_by_external_id(index, @fields[:estado])
    fields(index, i)['item_id'].to_i unless i.nil?
  end

  def set_estado_id(param)
    @estado = param
  end

  def formacao(index)
    i = get_field_index_by_external_id(index, @fields[:formacao])
    $enum_formacao.key(fields(index, i)['id'].to_i) unless i.nil?
  end

  def set_formacao(param)
    @formacao = $enum_formacao[param]
  end

  def curso(index)
    i = get_field_index_by_external_id(index, @fields[:curso])
    fields(index, i).to_s unless i.nil?
  end

  def set_curso(param)
    @curso = param
  end

  def semestre(index)
    i = get_field_index_by_external_id(index, @fields[:semestre])
    $enum_semestre.key(fields(index, i)['id'].to_i) unless i.nil?
  end

  def set_semestre(param)
    @semestre = $enum_semestre[param]
  end

  def faculdade(index)
    i = get_field_index_by_external_id(index, @fields[:faculdade])
    fields(index, i).to_s unless i.nil?
  end

  def set_faculdade(param)
    @faculdade = param
  end

  def ingles(index)
    i = get_field_index_by_external_id(index, @fields[:ingles])
    $enum_lingua.key(fields(index, i)['id'].to_i) unless i.nil?
  end

  def set_ingles(param)
    @ingles = $enum_lingua[param]
  end

  def espanhol(index)
    i = get_field_index_by_external_id(index, @fields[:espanhol])
    $enum_lingua.key(fields(index, i)['id'].to_i) unless i.nil?
  end

  def set_espanhol(param)
    @espanhol = $enum_lingua[param]
  end

  def entidade_id(index)
    i = get_field_index_by_external_id(index, @fields[:entidade])
    fields(index, i)['item_id'].to_i unless i.nil?
  end

  def set_entidade(param)
    @entidade = param
  end

  def turno(index)
    i = get_field_index_by_external_id(index, @fields[:turno])
    $enum_turno.key(fields(index, i)['id'].to_i) unless i.nil?
  end

  def set_turno(param)
    @turno = $enum_turno[param]
  end

  def programa_interesse(index)
    i = get_field_index_by_external_id(index, @fields[:programa_interesse])
    $enum_programa.key(fields(index, i)['id'].to_i) unless i.nil?
  end

  def set_programa_interesse(param)
    @programa_interesse = $enum_programa[param]
  end

  def conheceu_aiesec(index)
    i = get_field_index_by_external_id(index, @fields[:como_conheceu_aiesec])
    $enum_conheceu.key(fields(index, i)['id'].to_i) unless i.nil?
  end

  def set_conheceu_aiesec(param)
    @conheceu_aiesec = $enum_conheceu[param]
  end

  def pessoa_que_indicou(index)
    i = get_field_index_by_external_id(index, @fields[:pessoa_que_indiciou])
    fields(index, i).to_s unless i.nil?
  end

  def set_pessoa_que_indicou(param)
    @pessoa_que_indicou = param
  end

  def voluntario_ferias?(index)
    i = get_field_index_by_external_id(index, @fields[:volutnario_ferias])
    $enum_inscricao_especifica.key(fields(index, i)['id'].to_i) unless i.nil?
  end

  def set_voluntario_ferias(param)
    @voluntario_ferias = $enum_inscricao_especifica[param]
  end

  def projeto_especifico(index)
    i = get_field_index_by_external_id(index, @fields[:vaga_especifica])
    fields(index, i).to_s unless i.nil?
  end

  def set_projeto_especifico(param)
    @projeto_especifico = param
  end

  def responsavel_id(index)
    i = get_field_index_by_external_id(index, @fields[:responsavel])
    fields(index, i)['profile_id'].to_i unless i.nil?
  end

  def set_responsavel_id(param)
    @responsavel = param.to_i
  end

  def abordado?(index)
    i = get_field_index_by_external_id(index, @fields[:abordado])
    fields(index, i)['id'].to_i unless i.nil?
  end

  def set_abordado(param)
    @abordado = $enum_abordado[param]
  end

  def update(index)
    hash_fields = {}
    hash_fields.merge!(@fields[:nome] => @nome || nome_completo(index))
    hash_fields.merge!(@fields[:sexo] => @sexo || sexo(index))
    hash_fields.merge!(@fields[:data_nascimento] => {'start' => @data_nascimento || data_nascimento(index)})
    hash_fields.merge!(@fields[:telefone] => @telefone || telefone(index))
    hash_fields.merge!(@fields[:celular] => @celular || celular(index))
    hash_fields.merge!(@fields[:operadora] => @operadora || operadora(index))
    hash_fields.merge!(@fields[:email] => @email || email(index))
    hash_fields.merge!(@fields[:endereco] => @endereco || endereco(index))
    hash_fields.merge!(@fields[:cep] => @cep || cep(index))
    hash_fields.merge!(@fields[:cidade] => @cidade || cidade(index))
    hash_fields.merge!(@fields[:estado] => @estado || estado_id(index))
    hash_fields.merge!(@fields[:formacao] => @formacao || formacao(index))
    hash_fields.merge!(@fields[:curso] => @curso || curso(index))
    hash_fields.merge!(@fields[:semestre] => @semestre || semestre(index))
    hash_fields.merge!(@fields[:faculdade] => @faculdade || faculdade(index))
    hash_fields.merge!(@fields[:ingles] => @ingles || ingles(index))
    hash_fields.merge!(@fields[:espanhol] => @espanhol || espanhol(index))
    hash_fields.merge!(@fields[:entidade] => @entidade || entidade_id(index))
    hash_fields.merge!(@fields[:turno] => @turno || turno(index)) unless @turno.nil?
    hash_fields.merge!(@fields[:programa_interesse] => @programa_interesse || programa_interesse(index))
    hash_fields.merge!(@fields[:como_conheceu_aiesec] => @conheceu_aiesec || conheceu_aiesec(index))
    hash_fields.merge!(@fields[:pessoa_que_indicou] => @pessoa_que_indicou || pessoa_que_indicou(index))
    hash_fields.merge!(@fields[:voluntario_ferias] => @voluntario_ferias || voluntario_ferias?(index))
    hash_fields.merge!(@fields[:vaga_especifica] => @projeto_especifico || projeto_especifico(index))
    hash_fields.merge!(@fields[:responsavel] => @responsavel || responsavel_id(index))
    hash_fields.merge!(@fields[:abordado] => @abordado || abordado?(index))

    Podio::Item.update(item_id(index), { :fields => hash_fields })
  end

  def create
    hash_fields = {}
    hash_fields.merge!(@fields[:nome] => @nome) unless @nome.nil?
    hash_fields.merge!(@fields[:sexo] => @sexo) unless @sexo.nil?
    hash_fields.merge!(@fields[:data_nascimento] => {'start' => @data_nascimento}) unless @data_nascimento.nil?
    hash_fields.merge!(@fields[:telefone] => @telefone) unless @telefone.nil?
    hash_fields.merge!(@fields[:celular] => @celular) unless @celular.nil?
    hash_fields.merge!(@fields[:operadora] => @operadora) unless @operadora.nil?
    hash_fields.merge!(@fields[:email] => @email) unless @email.nil?
    hash_fields.merge!(@fields[:endereco] => @endereco) unless @endereco.nil?
    hash_fields.merge!(@fields[:cep] => @cep) unless @cep.nil?
    hash_fields.merge!(@fields[:cidade] => @cidade) unless @cidade.nil?
    hash_fields.merge!(@fields[:estado] => @estado) unless @estado.nil?
    hash_fields.merge!(@fields[:formacao] => @formacao) unless @formacao.nil?
    hash_fields.merge!(@fields[:curso] => @curso) unless @curso.nil?
    hash_fields.merge!(@fields[:semestre] => @semestre) unless @semestre.nil?
    hash_fields.merge!(@fields[:faculdade] => @faculdade) unless @faculdade.nil?
    hash_fields.merge!(@fields[:ingles] => @ingles) unless @ingles.nil?
    hash_fields.merge!(@fields[:espanhol] => @espanhol) unless @espanhol.nil?
    hash_fields.merge!(@fields[:entidade] => @entidade) unless @entidade.nil?
    hash_fields.merge!(@fields[:turno] => @turno) unless @turno.nil?
    hash_fields.merge!(@fields[:programa_interesse] => @programa_interesse) unless @programa_interesse.nil?
    hash_fields.merge!(@fields[:como_conheceu_aiesec] => @conheceu_aiesec) unless @conheceu_aiesec.nil?
    hash_fields.merge!(@fields[:pessoa_que_indicou] => @pessoa_que_indicou) unless @pessoa_que_indicou.nil?
    hash_fields.merge!(@fields[:voluntario_ferias] => @voluntario_ferias) unless @voluntario_ferias.nil?
    hash_fields.merge!(@fields[:vaga_especifica] => @projeto_especifico) unless @projeto_especifico.nil?

    Podio::Item.create(@app_id, { :fields => hash_fields })
  end

end
