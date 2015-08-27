require_relative '../control/podio_app_control'
require_relative '../enums'

class App3Dinamica < PodioAppControl

	def initialize(app_id)
		super(app_id)
		@fields = {
			:nome => 'nome',
			:sexo => 'sexo',
			:data_nascimento => 'data-de-nascimento-2',
			:telefone => 'telefone-2',
			:telefone_old => 'telefone-3',
			:celular => 'celular-2',
			:operadora => 'operadora-test',
			:email => 'email',
			:email_old => 'email-2',
			:endereco => 'endereco2',
			:cep => 'cep',
			:cidade => 'cidade',
			:estado => 'estado2',
			:formacao => 'formacao2',
			:curso => 'curso',
			:semestre => 'semestre-2',
			:faculdade => 'faculdade',
			:ingles => 'nivel-de-ingles',
			:espanhol => 'nivel-de-espanhol',
			:entidade => 'aiesec-mais-proxima2',
			:turno => 'melhor-turno-test',
			:programa_interesse => 'programa-de-interesse2',
			:como_conheceu_aiesec => 'como-conheceu-a-aiesec',
			:pessoa_que_indicou => 'nome-da-pessoaentidade-que-lhe-indicou',
			:voluntario_ferias => 'voce-esta-se-inscrevendo-para-o-programa-de-trabalho-vo',
			:vaga_especifica => 'caso-voce-esta-se-candidatando-a-algum-projetovaga-espe',
			:responsavel => 'responsavel-local',
			:data_abordagem => 'data-da-abordagem',
			:data_dinamica => 'data-da-dinamica',
			:foi_entrevistado => 'foi-entrevistado',
		}
	end

	# Getter for name of the pushful
	# @param index [Integer] Index of the item you want to retrieve the value
	# @return [String] Name of the pushful
	def nome_completo(index)
		i = get_field_index_by_external_id(index, @fields[:nome])
		fields(index, i).to_s unless i.nil?
	end

	# Setter for name of the pushful
	# @param param [String] The value you want to set
	# @return [String] Name of the pushful
	def set_nome_completo(param)
		@nome = param.to_s
	end

	# Getter for  of the pushful
	# @param index [Integer] Index of the item you want to retrieve the value
	# @return [String]  of the pushful
	def sexo(index)
		i = get_field_index_by_external_id(index, @fields[:sexo])
		$enum_sexo.key(fields(index, i)['id'].to_i) unless i.nil?
	end

	# Setter for sex of the pushful
	# @param param [String] The value you want to set
	# @return [Integer] Category Sex id of the pushful
	def set_sexo(param)
		@sexo = $enum_sexo[param]
	end

	# Getter for  of the pushful
	# @param index [Integer] Index of the item you want to retrieve the value
	# @return [String]  of the pushful
	def data_nascimento(index)
		i = get_field_index_by_external_id(index, @fields[:data_nascimento])
		DateTime.strptime(@item[0][0][:fields][i]['values'][0]['start_date'] + ' 00:00:00','%Y-%m-%d %H:%M:%S') unless i.nil?
	end

	# Setter for data_nascimento of the pushful
	# @param param [String] The value you want to set
	def set_data_nascimento(param)
		@data_nascimento = param.strftime('%Y-%m-%d %H:%M:%S')
	end

	# Setter for data_nascimento date format of the pushful
	# @param year [Integer] 
	# @param month [Integer] 
	# @param day [Integer] 
	# @param hour [Integer] 
	# @param minute [Integer] 
	def set_data_nascimento_format(year,month,day,hour,minute,second)
		@data_nascimento = DateTime.new(year,month,day,hour,minute,second).strftime('%Y-%m-%d %H:%M:%S')
	end

	# Getter for phones of the pushful
	# @param index [Integer] Index of the item you want to retrieve the value
	# @return [Array] List of Hashs with phone numbers of the pushful
	def phones(index)
		i = get_field_index_by_external_id(index, @fields[:telefone])
		values(index, i) unless i.nil?
	end

	# Setter for phones of the pushful
	# @param param [Array] The values you want to set
	def set_phones(param)
		@phones = param
	end

	# Getter for telefone of the pushful
	# @param index [Integer] Index of the item you want to retrieve the value
	# @return [String] Phone of the pushful
	def telefone(index)
		i = get_field_index_by_external_id(index, @fields[:telefone_old])
		fields(index, i).to_s.gsub(/[^0-9]/,'') unless i.nil?
	end

	# Setter for telefone of the pushful
	# @param param [String] The value you want to set
	def set_telefone(param)
		param.gsub!(/[^0-9]/,'')
		@telefone = param
	end

	# Getter for celular of the pushful
	# @param index [Integer] Index of the item you want to retrieve the value
	# @return [String] Celphone of the pushful
	def celular(index)
		i = get_field_index_by_external_id(index, @fields[:celular])
		fields(index, i).to_s.gsub(/[^0-9]/,'') unless i.nil?
	end

	# Setter for celular of the pushful
	# @param param [String] The value you want to set
	def set_celular(param)
		param.gsub!(/[^0-9]/,'')
		@celular = param
	end

	# Getter for operadora of the pushful
	# @param index [Integer] Index of the item you want to retrieve the value
	# @return [Integer] Category id of company phone of the pushful
	def operadora(index)
		i = get_field_index_by_external_id(index, @fields[:operadora])
		$enum_operadora.key(fields(index, i)['id'].to_i) unless i.nil?
	end

	# Setter for operadora of the pushful
	# @param param [Integer] The value you want to set
	def set_operadora(param)
		@operadora = $enum_operadora[param]
	end

	# Getter for emails of the pushful
	# @param index [Integer] Index of the item you want to retrieve the value
	# @return [Array] List of hashs emails of the pushfuls
	def emails(index)
		i = get_field_index_by_external_id(index, @fields[:email])
		values(index, i) unless i.nil?
	end

	# Setter for emails of the pushful
	# @param param [Array] The values you want to set
	def set_emails(param)
		@emails = param
	end

	# Getter for email_text of the pushful
	# @param index [Integer] Index of the item you want to retrieve the value
	# @return [String] Old Email of the pushful
	def email_text(index)
		i = get_field_index_by_external_id(index, @fields[:email_old])
		fields(index, i).to_s unless i.nil?
	end

	# Setter for email_text of the pushful
	# @param param [String] The value you want to set
	def set_email_text(param)
		@email_text = param
	end

	# Getter for endereco of the pushful
	# @param index [Integer] Index of the item you want to retrieve the value
	# @return [String] Street of the pushful
	def endereco(index)
		i = get_field_index_by_external_id(index, @fields[:endereco])
		fields(index, i).to_s unless i.nil?
	end

	# Setter for endereco of the pushful
	# @param param [String] The value you want to set
	def set_endereco(param)
		@endereco = param
	end

	# Getter for cep of the pushful
	# @param index [Integer] Index of the item you want to retrieve the value
	# @return [Integer] CEP of the pushful
	def cep(index)
		i = get_field_index_by_external_id(index, @fields[:cep])
		fields(index, i).to_s unless i.nil?
	end

	# Setter for cep of the pushful
	# @param param [String] The value you want to set
	def set_cep(param)
		@cep = param
	end

	# Getter for cidade of the pushful
	# @param index [Integer] Index of the item you want to retrieve the value
	# @return [String] City of the pushful
	def cidade(index)
		i = get_field_index_by_external_id(index, @fields[:cidade])
		fields(index, i).to_s unless i.nil?
	end

	# Setter for cidade of the pushful
	# @param param [String] The value you want to set
	def set_cidade(param)
		@cidade = param
	end

	# Getter for estado_id of the pushful
	# @param index [Integer] Index of the item you want to retrieve the value
	# @return [Integer] Id of referene of state of the pushful
	def estado_id(index)
		i = get_field_index_by_external_id(index, @fields[:estado])
		fields(index, i)['item_id'].to_i unless i.nil?
	end

	# Setter for estado_id of the pushful
	# @param param [Integer] The value you want to set
	def set_estado_id(param)
		@estado = param
	end

	# Getter for formacao of the pushful
	# @param index [Integer] Index of the item you want to retrieve the value
	# @return [Integer] Category id of formacao of the pushful
	def formacao(index)
		i = get_field_index_by_external_id(index, @fields[:formacao])
		$enum_formacao.key(fields(index, i)['id'].to_i) unless i.nil?
	end

	# Setter for formacao of the pushful
	# @param param [Integer] The value you want to set
	def set_formacao(param)
		@formacao = $enum_formacao[param]
	end

	# Getter for curso of the pushful
	# @param index [Integer] Index of the item you want to retrieve the value
	# @return [String] Course of the pushful
	def curso(index)
		i = get_field_index_by_external_id(index, @fields[:curso])
		fields(index, i).to_s unless i.nil?
	end

	# Setter for curso of the pushful
	# @param param [String] The value you want to set
	def set_curso(param)
		@curso = param
	end

	# Getter for  of the pushful
	# @param index [Integer] Index of the item you want to retrieve the value
	# @return [Integer] Category id of faculdade of the pushful
	def semestre(index)
		i = get_field_index_by_external_id(index, @fields[:semestre])
		$enum_semestre.key(fields(index, i)['id'].to_i) unless i.nil?
	end

	# Setter for semestre of the pushful
	# @param param [Integer] The value you want to set
	def set_semestre(param)
		@semestre = $enum_semestre[param]
	end

	# Getter for faculdade of the pushful
	# @param index [Integer] Index of the item you want to retrieve the value
	# @return [String] Name of faculdade of the pushful
	def faculdade(index)
		i = get_field_index_by_external_id(index, @fields[:faculdade])
		fields(index, i).to_s unless i.nil?
	end

	# Setter for faculdade of the pushful
	# @param param [String] The value you want to set
	def set_faculdade(param)
		@faculdade = param
	end

	# Getter for ingles of the pushful
	# @param index [Integer] Index of the item you want to retrieve the value
	# @return [Integer] Category id of ingles of the pushful
	def ingles(index)
		i = get_field_index_by_external_id(index, @fields[:ingles])
		$enum_lingua.key(fields(index, i)['id'].to_i) unless i.nil?
	end

	# Setter for ingles of the pushful
	# @param param [Integer] The value you want to set
	def set_ingles(param)
		@ingles = $enum_lingua[param]
	end

	# Getter for espanhol of the pushful
	# @param index [Integer] Index of the item you want to retrieve the value
	# @return [Integer] Category id of espanhol of the pushful
	def espanhol(index)
		i = get_field_index_by_external_id(index, @fields[:espanhol])
		$enum_lingua.key(fields(index, i)['id'].to_i) unless i.nil?
	end

	# Setter for espanhol of the pushful
	# @param param [Integer] The value you want to set
	def set_espanhol(param)
		@espanhol = $enum_lingua[param]
	end

	# Getter for entidade_id of the pushful
	# @param index [Integer] Index of the item you want to retrieve the value
	# @return [Integer] Id of referene of entity of the pushful
	def entidade_id(index)
		i = get_field_index_by_external_id(index, @fields[:entidade])
		fields(index, i)['item_id'].to_i unless i.nil?
	end

	# Setter for entidade_id of the pushful
	# @param param [Integer] The value you want to set
	def set_entidade(param)
		@entidade = param
	end

	# Getter for turno of the pushful
	# @param index [Integer] Index of the item you want to retrieve the value
	# @return [Integer] Category id of turno of the pushful
	def turno(index)
		i = get_field_index_by_external_id(index, @fields[:turno])
		$enum_turno.key(fields(index, i)['id'].to_i) unless i.nil?
	end

	# Setter for turno of the pushful
	# @param param [Integer] The value you want to set
	def set_turno(param)
		@turno = $enum_turno[param]
	end

	# Getter for programa_interesse of the pushful
	# @param index [Integer] Index of the item you want to retrieve the value
	# @return [Integer] Category id of programa_interesse of the pushful
	def programa_interesse(index)
		i = get_field_index_by_external_id(index, @fields[:programa_interesse])
		$enum_programa.key(fields(index, i)['id'].to_i) unless i.nil?
	end

	# Setter for programa_interesse of the pushful
	# @param param [Integer] The value you want to set
	def set_programa_interesse(param)
		@programa_interesse = $enum_programa[param]
	end

	# Getter for conheceu_aiesec of the pushful
	# @param index [Integer] Index of the item you want to retrieve the value
	# @return [Integer] Category id of conheceu_aiesec of the pushful
	def conheceu_aiesec(index)
		i = get_field_index_by_external_id(index, @fields[:como_conheceu_aiesec])
		$enum_conheceu.key(fields(index, i)['id'].to_i) unless i.nil?
	end

	# Setter for conheceu_aiesec of the pushful
	# @param param [Integer] The value you want to set
	def set_conheceu_aiesec(param)
		@conheceu_aiesec = $enum_conheceu[param]
	end

	# Getter for pessoa_que_indicou of the pushful
	# @param index [Integer] Index of the item you want to retrieve the value
	# @return [String] Name of the pushful that indicate
	def pessoa_que_indicou(index)
		i = get_field_index_by_external_id(index, @fields[:pessoa_que_indicou])
		fields(index, i).to_s unless i.nil?
	end

	# Setter for pessoa_que_indicou of the pushful
	# @param param [String] The value you want to set
	def set_pessoa_que_indicou(param)
		@pessoa_que_indicou = param
	end

	# Getter for voluntario_ferias of the pushful
	# @param index [Integer] Index of the item you want to retrieve the value
	# @return [Boolean] If pushful was just for summer volunteer
	def voluntario_ferias?(index)
		i = get_field_index_by_external_id(index, @fields[:volutnario_ferias])
		$enum_inscricao_especifica.key(fields(index, i)['id'].to_i) unless i.nil?
	end

	# Setter for voluntario_ferias of the pushful
	# @param param [Integer] The value you want to set
	def set_voluntario_ferias(param)
		@voluntario_ferias = $enum_inscricao_especifica[param]
	end

	# Getter for projeto_especifico of the pushful
	# @param index [Integer] Index of the item you want to retrieve the value
	# @return [Integer] Category id of projeto_especifico of the pushful
	def projeto_especifico(index)
		i = get_field_index_by_external_id(index, @fields[:vaga_especifica])
		fields(index, i).to_s unless i.nil?
	end

	# Setter for projeto_especifico of the pushful
	# @param param [Integer] The value you want to set
	def set_projeto_especifico(param)
		@projeto_especifico = param
	end

	# Getter for responsavel_id of the pushful
	# @param index [Integer] Index of the item you want to retrieve the value
	# @return [Integer] Id of referene of responsable of the pushful
	def responsavel_id(index)
		i = get_field_index_by_external_id(index, @fields[:responsavel])
		fields(index, i)['profile_id'].to_i unless i.nil?
	end

	# Setter for responsavel_id of the pushful
	# @param param [Integer] The value you want to set
	def set_responsavel_id(param)
		@responsavel = param.to_i
	end

  # Getter for approached date of the pushful
  # @param index [Integer] Index of the item you want to retrieve the value
  # @return [String] Approached date of the pushful
  def data_abordagem(index)
    i = get_field_index_by_external_id(index, @fields[:data_abordagem])
    DateTime.strptime(@item[0][0][:fields][i]['values'][0]['start_date'] + ' 00:00:00','%Y-%m-%d %H:%M:%S') unless i.nil?
  end

  # Setter for approached date
  # @param param [DateTime] Approached date
  def data_abordagem=(param)
    @data_abordagem = param.strftime('%Y-%m-%d %H:%M:%S')
  end

  # Getter for dynamic date of the pushful
  # @param index [Integer] Index of the item you want to retrieve the value
  # @return [String] Dynamic date of the pushful
  def data_dinamica(index)
    i = get_field_index_by_external_id(index, @fields[:data_dinamica])
    DateTime.strptime(@item[0][0][:fields][i]['values'][0]['start_date'] + ' 00:00:00','%Y-%m-%d %H:%M:%S') unless i.nil?
  end

  # Setter for Dynamic date
  # @param param [DateTime] Dynamic date
  def data_dinamica=(param)
    @data_dinamica = param.strftime('%Y-%m-%d %H:%M:%S')
  end

  # Getter for foi_entrevistado of the pushful
  # @param index [Integer] Index of the item you want to retrieve the value
  # @return [enum_compareceu_dinamica] If pushful was in group selection
  def foi_entrevistado(index)
    i = get_field_index_by_external_id(index, @fields[:foi_entrevistado])
    $enum_entrevistado.key(fields(index, i)['id'].to_i) unless i.nil?
  end

  # Setter for foi_entrevistado of the addressed
  # @param param [Symbol] The value you want to set
  def foi_entrevistado(param)
    @entrevistado = $enum_entrevistado[param]
  end

	# Populate self variables with the values of an approached object
	# @param abordado [App2Abordado] Reference of the Approached object
	# @param i [Integer] Index of the item you want to retrieve
	def populate(abordado,i)
		self.set_nome_completo(abordado.nome_completo(i))
		self.set_sexo(abordado.sexo(i))
		self.set_data_nascimento(abordado.data_nascimento(i))
		self.set_phones(abordado.phones(i))
		self.set_telefone(abordado.telefone(i))
		self.set_celular(abordado.celular(i))
		self.set_operadora(abordado.operadora(i))
		self.set_emails(abordado.emails(i))
		self.set_email_text(abordado.email_text(i))
		self.set_endereco(abordado.endereco(i))
		self.set_cep(abordado.cep(i))
		self.set_cidade(abordado.cidade(i))
		self.set_estado_id(abordado.estado_id(i))
		self.set_formacao(abordado.formacao(i))
		self.set_curso(abordado.curso(i))
		self.set_semestre(abordado.semestre(i))
		self.set_faculdade(abordado.faculdade(i))
		self.set_ingles(abordado.ingles(i))
		self.set_espanhol(abordado.espanhol(i))
		self.set_entidade(abordado.entidade_id(i))
		self.set_turno(abordado.turno(i))
		self.set_programa_interesse(abordado.programa_interesse(i))
		self.set_conheceu_aiesec(abordado.conheceu_aiesec(i))
		self.set_pessoa_que_indicou(abordado.pessoa_que_indicou(i))
		self.set_voluntario_ferias(abordado.voluntario_ferias?(i))
		self.set_projeto_especifico(abordado.projeto_especifico(i))
		self.set_responsavel_id(abordado.responsavel_id(i))
		self.data_abordagem=(abordado.data_abordagem(i))
    self.data_dinamica=(DateTime.current)
    self.foi_entrevistado($enum_entrevistado[:nao])
	end

	# Update register on Podio database
	# @param index [Integer] Index of the item you want to retrieve the value
	def update(index)
		hash_fields = {}
		hash_fields.merge!(@fields[:nome] => @nome || nome_completo(index))
		hash_fields.merge!(@fields[:sexo] => @sexo || sexo(index))
		hash_fields.merge!(@fields[:data_nascimento] => {'start' => @data_nascimento || data_nascimento(index)})
		hash_fields.merge!(@fields[:telefone] => @phones || phones(index))
		hash_fields.merge!(@fields[:telefone_old] => @telefone || telefone(index))
		hash_fields.merge!(@fields[:celular] => @celular || celular(index))
		hash_fields.merge!(@fields[:operadora] => @operadora || operadora(index))
		hash_fields.merge!(@fields[:email] => @emails || emails(index))
		hash_fields.merge!(@fields[:email_old] => @email_text || email_text(index))
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
    hash_fields.merge!(@fields[:data_abordagem] => @data_abordagem || data_responsavel(index))
    hash_fields.merge!(@fields[:data_dinamica] => @data_dinamica || data_dinamica(index))
    hash_fields.merge!(@fields[:foi_entrevistado] => @entrevistado || foi_entrevistado(index))


		Podio::Item.update(item_id(index), { :fields => hash_fields })
	end

	# Create register on Podio database
	def create
		hash_fields = {}
		hash_fields.merge!(@fields[:nome] => @nome) unless @nome.nil?
		hash_fields.merge!(@fields[:sexo] => @sexo) unless @sexo.nil?
		hash_fields.merge!(@fields[:data_nascimento] => {'start' => @data_nascimento}) unless @data_nascimento.nil?
		hash_fields.merge!(@fields[:telefone] => @phones) unless @phones.nil?
		hash_fields.merge!(@fields[:telefone_old] => @telefone) unless @telefone.nil?
		hash_fields.merge!(@fields[:celular] => @celular) unless @celular.nil?
		hash_fields.merge!(@fields[:operadora] => @operadora) unless @operadora.nil?
		hash_fields.merge!(@fields[:email] => @emails) unless @emails.nil?
		hash_fields.merge!(@fields[:email_old] => @email_text) unless @email_text.nil?
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
		hash_fields.merge!(@fields[:responsavel] => @responsavel) unless @responsavel.nil?
    hash_fields.merge!(@fields[:data_abordagem] => @data_abordagem) unless @data_abordagem.nil?
    hash_fields.merge!(@fields[:data_dinamica] => @data_dinamica) unless @data_dinamica.nil?
    hash_fields.merge!(@fields[:foi_entrevistado] => @entrevistado) unless @entrevistado.nil?

		Podio::Item.create(@app_id, { :fields => hash_fields })
  end

  # Delete register on Podio database
  # @param index [Integer] Index of the item you want to delete
  def delete(index)
    Podio::Item.delete(item_id(index))
  end

end