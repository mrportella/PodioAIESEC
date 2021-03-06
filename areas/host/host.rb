require_relative '../../control/control_database_workspace'
require_relative '../../control/control_database_app'
require_relative 'host_dao'

# This class initializes, configure and take care of the tm module.
# The module is divided in 3 categories:
# * 1. ORS ( 1 x )
# * 2. Local ( Number of entities x )
# * 3. National ( 1 x )
class HOST
  # @param spaces [ControlDatabaseWorkspace] List of workspaces registered at the IM General
  # @param apps [ControlDatabaseApp] List of apps registered at the IM General
  def initialize(podioDatabase)
    puts(self.class.name + '.' + __method__.to_s + ' - ' + Time.now.utc.to_s)

    spaces = podioDatabase.workspaces
    apps = podioDatabase.apps
    log = podioDatabase.logs
    config(spaces,apps)
    flow
    #TODO passagem de um CL para outro
  end

  def config(spaces,apps)
    puts(self.class.name + '.' + __method__.to_s + ' - ' + Time.now.utc.to_s)
    @local_apps_ids1 = {}
    @local_apps_ids2 = {}
    @local_apps_ids3 = {}
    @local_apps_ids4 = {}
    @national_apps = {}

    @entities1 = []
    @entities2 = []
    @entities3 = []
    @entities4 = []
    for i in 0...spaces.total_count
      if !spaces.entity(i).nil? &&
          !spaces.id(i).nil? &&
          spaces.type(i) == $enum_type[:local] &&
          spaces.area(i) == $enum_area[:host]
        @entities1 << spaces.entity(i)
        @local_apps_ids1[spaces.entity(i)] = {:empty => ''}
      end
      if !spaces.entity(i).nil? &&
          !spaces.id2(i).nil? &&
          spaces.type(i) == $enum_type[:local] &&
          spaces.area(i) == $enum_area[:host]
        @entities2 << spaces.entity(i)
        @local_apps_ids2[spaces.entity(i)] = {:empty => ''}
      end
      if !spaces.entity(i).nil? &&
          !spaces.id3(i).nil? &&
          spaces.type(i) == $enum_type[:local] &&
          spaces.area(i) == $enum_area[:host]
        @entities3 << spaces.entity(i)
        @local_apps_ids3[spaces.entity(i)] = {:empty => ''}
      end
      if !spaces.entity(i).nil? &&
          !spaces.id4(i).nil? &&
          spaces.type(i) == $enum_type[:local] &&
          spaces.area(i) == $enum_area[:host]
        @entities4 << spaces.entity(i)
        @local_apps_ids4[spaces.entity(i)] = {:empty => ''}
      end
    end
    @entities1.uniq!
    @entities2.uniq!
    @entities3.uniq!
    @entities4.uniq!

    @ors = HostDAO.new(14576062)

    @national_apps[:leads] = HostDAO.new(14871523)
    @national_apps[:approach] = HostDAO.new(14871524)
    @national_apps[:reapproach] = HostDAO.new(14871526)
    @national_apps[:alignment] = HostDAO.new(14871531)
    @national_apps[:blacklist] = HostDAO.new(14871532)
    @national_apps[:whitelist] = HostDAO.new(14871534)

    for j in 0...apps.total_count
      work_id = apps.workspace_id_calculated(j) || apps.workspace_id2_calculated(j) || apps.workspace_id3_calculated(j) || apps.workspace_id4_calculated(j)
      for i in 0...spaces.total_count
        next unless !work_id.nil? && (!spaces.id(i).nil? || !spaces.id2(i).nil? || !spaces.id3(i).nil? || !spaces.id4(i).nil?)
        entity = spaces.entity(i)

        if !entity.nil? &&
              spaces.id(i) == work_id &&
              spaces.type(i) == $enum_type[:local] &&
              spaces.area(i) == $enum_area[:host]
          case apps.name(j)
            when $enum_HOST_apps_name[:leads] then @local_apps_ids1[entity].merge!({:leads => HostDAO.new(apps.id(j))})
            when $enum_HOST_apps_name[:approach] then @local_apps_ids1[entity].merge!({:approach => HostDAO.new(apps.id(j))})
            when $enum_HOST_apps_name[:reapproach] then @local_apps_ids1[entity].merge!({:reapproach => HostDAO.new(apps.id(j))})
            when $enum_HOST_apps_name[:alignment] then @local_apps_ids1[entity].merge!({:alignment => HostDAO.new(apps.id(j))})
            when $enum_HOST_apps_name[:blacklist] then @local_apps_ids1[entity].merge!({:blacklist => HostDAO.new(apps.id(j))})
            when $enum_HOST_apps_name[:whitelist] then @local_apps_ids1[entity].merge!({:whitelist => HostDAO.new(apps.id(j))})
          end

        elsif !entity.nil? &&
            spaces.id2(i) == work_id &&
            spaces.type(i) == $enum_type[:local] &&
            spaces.area(i) == $enum_area[:host]
          case apps.name(j)
            when $enum_HOST_apps_name[:leads] then @local_apps_ids2[entity].merge!({:leads => HostDAO.new(apps.id(j))})
            when $enum_HOST_apps_name[:approach] then @local_apps_ids2[entity].merge!({:approach => HostDAO.new(apps.id(j))})
            when $enum_HOST_apps_name[:reapproach] then @local_apps_ids2[entity].merge!({:reapproach => HostDAO.new(apps.id(j))})
            when $enum_HOST_apps_name[:alignment] then @local_apps_ids2[entity].merge!({:alignment => HostDAO.new(apps.id(j))})
            when $enum_HOST_apps_name[:blacklist] then @local_apps_ids2[entity].merge!({:blacklist => HostDAO.new(apps.id(j))})
            when $enum_HOST_apps_name[:whitelist] then @local_apps_ids2[entity].merge!({:whitelist => HostDAO.new(apps.id(j))})
          end

        elsif !entity.nil? &&
            spaces.id3(i) == work_id &&
            spaces.type(i) == $enum_type[:local] &&
            spaces.area(i) == $enum_area[:host]
          case apps.name(j)
            when $enum_HOST_apps_name[:leads] then @local_apps_ids3[entity].merge!({:leads => HostDAO.new(apps.id(j))})
            when $enum_HOST_apps_name[:approach] then @local_apps_ids3[entity].merge!({:approach => HostDAO.new(apps.id(j))})
            when $enum_HOST_apps_name[:reapproach] then @local_apps_ids3[entity].merge!({:reapproach => HostDAO.new(apps.id(j))})
            when $enum_HOST_apps_name[:alignment] then @local_apps_ids3[entity].merge!({:alignment => HostDAO.new(apps.id(j))})
            when $enum_HOST_apps_name[:blacklist] then @local_apps_ids3[entity].merge!({:blacklist => HostDAO.new(apps.id(j))})
            when $enum_HOST_apps_name[:whitelist] then @local_apps_ids3[entity].merge!({:whitelist => HostDAO.new(apps.id(j))})
          end

        elsif !entity.nil? &&
            spaces.id4(i) == work_id &&
            spaces.type(i) == $enum_type[:local] &&
            spaces.area(i) == $enum_area[:host]
          case apps.name(j)
            when $enum_HOST_apps_name[:leads] then @local_apps_ids4[entity].merge!({:leads => HostDAO.new(apps.id(j))})
            when $enum_HOST_apps_name[:approach] then @local_apps_ids4[entity].merge!({:approach => HostDAO.new(apps.id(j))})
            when $enum_HOST_apps_name[:reapproach] then @local_apps_ids4[entity].merge!({:reapproach => HostDAO.new(apps.id(j))})
            when $enum_HOST_apps_name[:alignment] then @local_apps_ids4[entity].merge!({:alignment => HostDAO.new(apps.id(j))})
            when $enum_HOST_apps_name[:blacklist] then @local_apps_ids4[entity].merge!({:blacklist => HostDAO.new(apps.id(j))})
            when $enum_HOST_apps_name[:whitelist] then @local_apps_ids4[entity].merge!({:whitelist => HostDAO.new(apps.id(j))})
          end
        end
      end
    end
  end

  def flow
    puts(self.class.name + '.' + __method__.to_s + ' - ' + Time.now.utc.to_s)
    ors_to_local
    for i in 0..3 do
      #update_national_local(i)
      local_to_local
    end
  end

  # Migrate leads from the ORS next_app to all Local Leads Apps
  def ors_to_local
    puts(self.class.name + '.' + __method__.to_s + ' - ' + Time.now.utc.to_s)
    models_list = @ors.find_ors_to_local_lead
    models_list.each do |national_ors|
      sleep(3600) unless $podio_flag == true
      $podio_flag = true
      next unless @local_apps_ids1.has_key?(national_ors.local_aiesec)
      local_leads = @local_apps_ids1[national_ors.local_aiesec][:leads]
      abort('Wrong parameter for leads in ' + self.class.name + '.' + __method__.to_s) unless local_leads.is_a?(HostDAO)
      puts(self.class.name + '.' + __method__.to_s + ' ~ ' + national_ors.local_aiesec.to_s + ' - ' + Time.now.utc.to_s)

      local_leads4 = local_leads3 = local_leads2 = nil
      local_leads2 = @local_apps_ids2[national_ors.local_aiesec][:leads] if @local_apps_ids2.has_key?(national_ors.local_aiesec)
      local_leads3 = @local_apps_ids3[national_ors.local_aiesec][:leads] if @local_apps_ids3.has_key?(national_ors.local_aiesec)
      local_leads4 = @local_apps_ids4[national_ors.local_aiesec][:leads] if @local_apps_ids4.has_key?(national_ors.local_aiesec)

      local_lead = local_leads.new_model(national_ors.to_h)
      local_lead.lead_date = {'start' => Time.new.strftime('%Y-%m-%d %H:%M:%S')}

      if local_leads2.is_a?(HostDAO)
        local_lead2 = local_leads2.new_model(national_ors.to_h)
        local_lead2.lead_date = {'start' => Time.new.strftime('%Y-%m-%d %H:%M:%S')}
      end
      if local_leads3.is_a?(HostDAO)
        local_lead3 = local_leads3.new_model(national_ors.to_h)
        local_lead3.lead_date = {'start' => Time.new.strftime('%Y-%m-%d %H:%M:%S')}
      end
      if local_leads4.is_a?(HostDAO)
        local_lead4 = local_leads4.new_model(national_ors.to_h)
        local_lead4.lead_date = {'start' => Time.new.strftime('%Y-%m-%d %H:%M:%S')}
      end

      national_ors.sync_with_local = 2
      national_app1 = @national_apps[:leads].new_model(national_ors.to_h)
      national_app1.lead_date = {'start' => Time.new.strftime('%Y-%m-%d %H:%M:%S')}

      begin
        national_app1.id_local_gcdp_1 = national_ors.id_local_gcdp_1 = local_lead.create
        national_app1.id_local_gip_1 = national_ors.id_local_gip_1 = local_lead2.create if local_leads2.is_a?(HostDAO)
        national_app1.id_local_gcdp_2 = national_ors.id_local_gcdp_2 = local_lead3.create if local_leads3.is_a?(HostDAO)
        national_app1.id_local_gip_2 = national_ors.id_local_gip_2 = local_lead4.create if local_leads4.is_a?(HostDAO)

        national_ors.update
        national_app1.create
      rescue => exception
        puts exception.to_s
      end
    end
  end

  def update_national_local(iteration)
    puts(self.class.name + '.' + __method__.to_s + ' - ' + Time.now.utc.to_s)
    for entities in @entities1.zip(@entities2, @entities3, @entities4) do
      next if entities[iteration].nil?
      entity = entities[iteration]
      local_apps_ids = [@local_apps_ids1, @local_apps_ids2, @local_apps_ids3, @local_apps_ids4]

      abort('Wrong parameter for leads in ' + self.class.name + '.' + __method__.to_s + ' at entity ' + entity.to_s + ' and iteration ' + iteration.to_s) unless local_apps_ids[iteration][entity][:leads].is_a?(HostDAO)
      abort('Wrong parameter for approach in ' + self.class.name + '.' + __method__.to_s + ' at entity ' + entity.to_s + ' and iteration ' + iteration.to_s) unless local_apps_ids[iteration][entity][:approach].is_a?(HostDAO)
      abort('Wrong parameter for reapproach in ' + self.class.name + '.' + __method__.to_s + ' at entity ' + entity.to_s + ' and iteration ' + iteration.to_s) unless local_apps_ids[iteration][entity][:reapproach].is_a?(HostDAO)
      abort('Wrong parameter for alignment in ' + self.class.name + '.' + __method__.to_s + ' at entity ' + entity.to_s + ' and iteration ' + iteration.to_s) unless local_apps_ids[iteration][entity][:alignment].is_a?(HostDAO)
      abort('Wrong parameter for blacklist in ' + self.class.name + '.' + __method__.to_s + ' at entity ' + entity.to_s + ' and iteration ' + iteration.to_s) unless local_apps_ids[iteration][entity][:blacklist].is_a?(HostDAO)
      abort('Wrong parameter for whitelist in ' + self.class.name + '.' + __method__.to_s + ' at entity ' + entity.to_s + ' and iteration ' + iteration.to_s) unless local_apps_ids[iteration][entity][:whitelist].is_a?(HostDAO)

      sleep(3600) unless $podio_flag == true
      $podio_flag = true
      leads = local_apps_ids[iteration][entity][:leads].find_all
      leads.each do |lead|
        update_local_national_helper(iteration, lead)
      end

      sleep(3600) unless $podio_flag == true
      $podio_flag = true
      approaches = local_apps_ids[iteration][entity][:approach].find_all
      approaches.each do |approach|
        update_local_national_helper(iteration, approach)
      end

      sleep(3600) unless $podio_flag == true
      $podio_flag = true
      reapproaches = local_apps_ids[iteration][entity][:reapproach].find_all
      reapproaches.each do |reapproach|
        update_local_national_helper(iteration, reapproach)
      end

      sleep(3600) unless $podio_flag == true
      $podio_flag = true
      aligns = local_apps_ids[iteration][entity][:alignment].find_all
      aligns.each do |alignment|
        update_local_national_helper(iteration, alignment)
      end

      sleep(3600) unless $podio_flag == true
      $podio_flag = true
      blacklists = local_apps_ids[iteration][entity][:blacklist].find_all
      blacklists.each do |blacklist|
        update_local_national_helper(iteration, blacklist)
      end

      sleep(3600) unless $podio_flag == true
      $podio_flag = true
      whitelists = local_apps_ids[iteration][entity][:whitelist].find_all
      whitelists.each do |whitelist|
        update_local_national_helper(iteration, whitelist)
      end
    end
  end

  # For all local apps, move the registers through customer flow.
  def local_to_local
    puts(self.class.name + '.' + __method__.to_s + ' - ' + Time.now.utc.to_s)
    @entities1.each do |entity|

      abort('Wrong parameter for leads in ' + self.class.name + '.' + __method__.to_s + ' at entity ' + entity.to_s) unless @local_apps_ids1[entity][:leads].is_a?(HostDAO)
      abort('Wrong parameter for approach in ' + self.class.name + '.' + __method__.to_s + ' at entity ' + entity.to_s) unless @local_apps_ids1[entity][:approach].is_a?(HostDAO)
      abort('Wrong parameter for reapproach in ' + self.class.name + '.' + __method__.to_s + ' at entity ' + entity.to_s) unless @local_apps_ids1[entity][:reapproach].is_a?(HostDAO)
      abort('Wrong parameter for alignment in ' + self.class.name + '.' + __method__.to_s + ' at entity ' + entity.to_s) unless @local_apps_ids1[entity][:alignment].is_a?(HostDAO)
      abort('Wrong parameter for blacklist in ' + self.class.name + '.' + __method__.to_s + ' at entity ' + entity.to_s) unless @local_apps_ids1[entity][:blacklist].is_a?(HostDAO)
      abort('Wrong parameter for whitelist in ' + self.class.name + '.' + __method__.to_s + ' at entity ' + entity.to_s) unless @local_apps_ids1[entity][:whitelist].is_a?(HostDAO)

      sleep(3600) unless $podio_flag == true
      $podio_flag = true
      leads = @local_apps_ids1[entity][:leads].find_all
      leads.each do |lead|
        local_to_local_helper(entity, lead,:leads, :approach) if @local_apps_ids1[entity][:leads].go_to_approach?(lead)
      end

      sleep(3600) unless $podio_flag == true
      $podio_flag = true
      approaches = @local_apps_ids1[entity][:approach].find_all
      approaches.each do |approached|
        local_to_local_helper(entity, approached, :approach, :reapproach) if @local_apps_ids1[entity][:approach].go_to_reapproach?(approached)
        local_to_local_helper(entity, approached, :approach, :alignment) if @local_apps_ids1[entity][:approach].go_to_alignment?(approached)
      end

      sleep(3600) unless $podio_flag == true
      $podio_flag = true
      aligns = @local_apps_ids1[entity][:alignment].find_all
      aligns.each do |aligned|
        local_to_local_helper(entity, aligned, :alignment, :blacklist) if @local_apps_ids1[entity][:alignment].go_to_blacklist?(aligned)
        local_to_local_helper(entity, aligned, :alignment, :whitelist) if @local_apps_ids1[entity][:alignment].go_to_whitelist?(aligned)
      end

      sleep(3600) unless $podio_flag == true
      $podio_flag = true
      reapproaches = @local_apps_ids1[entity][:reapproach].find_all
      reapproaches.each do |reapproached|
        local_to_local_helper(entity, reapproached, :reapproach, :alignment) if @local_apps_ids1[entity][:reapproach].finally_go_to_alignment?(reapproached)
      end
    end
  end

  def update_local_national_helper(iteration, element)
    original = nil
    case iteration
      when 0 then original = @ors.find_national_local_id_1(element.id)[0]
      when 1 then original = @ors.find_national_local_id_2(element.id)[0]
      when 2 then original = @ors.find_national_local_id_3(element.id)[0]
      when 3 then original = @ors.find_national_local_id_4(element.id)[0]
      else nil
    end

    item1 = Podio::Item.find(original.id_local_gcdp_1) unless original.id_local_gcdp_1.nil?
    item2 = Podio::Item.find(original.id_local_gip_1) unless original.id_local_gip_1.nil?
    item3 = Podio::Item.find(original.id_local_gcdp_2) unless original.id_local_gcdp_2.nil?
    item4 = Podio::Item.find(original.id_local_gip_2) unless original.id_local_gip_2.nil?

    ok = true
    case iteration
      when 0
        for i in 0..item1.attributes[:fields].count
          (ok = false if item1.attributes[:fields][i].values != item2.attributes[:fields][i].values) unless item2.nil?
          (ok = false if item1.attributes[:fields][i].values != item3.attributes[:fields][i].values) unless item3.nil?
          (ok = false if item1.attributes[:fields][i].values != item4.attributes[:fields][i].values) unless item4.nil?
        end
      when 1
        for i in 0..item2.attributes[:fields].count
          (ok = false if item2.attributes[:fields][i].values != item1.attributes[:fields][i].values) unless item1.nil?
          (ok = false if item2.attributes[:fields][i].values != item3.attributes[:fields][i].values) unless item3.nil?
          (ok = false if item2.attributes[:fields][i].values != item4.attributes[:fields][i].values) unless item4.nil?
        end
      when 2
        for i in 0..item3.attributes[:fields].count
          (ok = false if item3.attributes[:fields][i].values != item1.attributes[:fields][i].values) unless item1.nil?
          (ok = false if item3.attributes[:fields][i].values != item2.attributes[:fields][i].values) unless item2.nil?
          (ok = false if item3.attributes[:fields][i].values != item4.attributes[:fields][i].values) unless item4.nil?
        end
      when 3
        for i in 0..item4.attributes[:fields].count
          (ok = false if item4.attributes[:fields][i].values != item1.attributes[:fields][i].values) unless item1.nil?
          (ok = false if item4.attributes[:fields][i].values != item2.attributes[:fields][i].values) unless item2.nil?
          (ok = false if item4.attributes[:fields][i].values != item3.attributes[:fields][i].values) unless item3.nil?
        end
      else nil
    end

    if ok == false
      case iteration
        when 0
          for i in 0..item1.attributes[:fields].count
            item2.attributes[:fields][i].values = item1.attributes[:fields][i].values unless item2.nil?
            item3.attributes[:fields][i].values = item1.attributes[:fields][i].values unless item3.nil?
            item4.attributes[:fields][i].values = item1.attributes[:fields][i].values unless item4.nil?
          end
        when 1
          for i in 0..item2.attributes[:fields].count
            item1.attributes[:fields][i].values = item2.attributes[:fields][i].values unless item1.nil?
            item3.attributes[:fields][i].values = item2.attributes[:fields][i].values unless item3.nil?
            item4.attributes[:fields][i].values = item2.attributes[:fields][i].values unless item4.nil?
          end
        when 2
          for i in 0..item3.attributes[:fields].count
            item1.attributes[:fields][i].values = item3.attributes[:fields][i].values unless item1.nil?
            item2.attributes[:fields][i].values = item3.attributes[:fields][i].values unless item2.nil?
            item4.attributes[:fields][i].values = item3.attributes[:fields][i].values unless item3.nil?
          end
        when 3
          for i in 0..item4.attributes[:fields].count
            item1.attributes[:fields][i].values = item4.attributes[:fields][i].values unless item1.nil?
            item2.attributes[:fields][i].values = item4.attributes[:fields][i].values unless item2.nil?
            item3.attributes[:fields][i].values = item4.attributes[:fields][i].values unless item3.nil?
          end
        else nil
      end
      begin
        item1.update unless item1.nil?
        item2.update unless item2.nil?
        item3.update unless item3.nil?
        item4.update unless item4.nil?
      rescue => excetion
        puts excetion.to_s
      end
    end
  end


  def local_to_local_helper(entity, element, current_app, next_app)
    original = @national_apps[current_app].find_national_local_id_1(element.id).first
    to_be_created = @local_apps_ids1[entity][next_app].new_model(element.to_h)
    to_be_created_national = @national_apps[next_app].new_model(element.to_h)
    begin
      Podio::Item.delete(original.id_local_gcdp_1) unless original.nil? || original.id_local_gcdp_1.nil?
      element.delete
      to_be_created_national.id_local_gcdp_1 = to_be_created.create
      to_be_created_national.create

    #
    #
    #entities = @entities1.zip(@entities2, @entities3, @entities4)
    #entity = entities[iteration]
    #
    #case iteration
    #  when 0 then original = @ors.find_national_local_id_1(element.id)[0]
    #  when 1 then original = @ors.find_national_local_id_2(element.id)[0]
    #  when 2 then original = @ors.find_national_local_id_3(element.id)[0]
    #  when 3 then original = @ors.find_national_local_id_4(element.id)[0]
    #  else nil
    #end
    #
    #begin
    #  if entities[0].include?(entity)
    #    to_be_created = @local_apps_ids1[entity][next_app].new_model(element.to_h)
    #    Podio::Item.delete(original.id_local_gcdp_1) unless original.id_local_gcdp_1.nil?
    #    original.id_local_gcdp_1 = to_be_created.create
    #  end
    #
    #  sleep(3600) unless $podio_flag == true
    #  $podio_flag = true
    #  if entities[1].include?(entity)
    #    to_be_created = @local_apps_ids2[entity][next_app].new_model(element.to_h)
    #    Podio::Item.delete(original.id_local_gip_1) unless original.id_local_gip_1.nil?
    #    original.id_local_gip_1 = to_be_created.create
    #  end
    #
    #  sleep(3600) unless $podio_flag == true
    #  $podio_flag = true
    #  if entities[2].include?(entity)
    #    to_be_created = @local_apps_ids3[entity][next_app].new_model(element.to_h)
    #    Podio::Item.delete(original.id_local_gcdp_2) unless original.id_local_gcdp_2.nil?
    #    original.id_local_gcdp_2 = to_be_created.create
    # end
    #
    # sleep(3600) unless $podio_flag == true
    #  $podio_flag = true
    #  if entities[3].include?(entity)
    #    to_be_created = @local_apps_ids4[entity][next_app].new_model(element.to_h)
    #    Podio::Item.delete(original.id_local_gip_2) unless original.id_local_gip_2.nil?
    #    original.id_local_gip_2 = to_be_created.create
    #  end
    #  original.update
    #
    rescue => exception
      puts exception.to_s
    end
  end
end