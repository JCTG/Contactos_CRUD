class Libretum < ApplicationRecord

  #require 'validates_email_format_of'

	validates :nombre, :presence => true,:length => { :maximum => 200 }

	validates :tlf   , :presence => true,:length   => {:minimum => 10}

  validates :email   , :presence => true 
  # se requiere una gema 'email_validator' en el archivo de gem
  validates :email, :email_format => {:message => 'the format of the email is not correct'}

  #validación de filtros
  filterrific(
  default_filter_params: { search_query: 'Guadalupe' },
  #sorted_by: 'created_at_desc' },
  available_filters: [
   # :sorted_by,
    :search_query#,
   # :with_country_id,
   # :with_created_at_gte
  ]
)
# define ActiveRecord scopes for
# :search_query, :sorted_by, :with_country_id, and :with_created_at_gte

  # Scope definitions. We implement all Filterrific filters through ActiveRecord
  # scopes. In this example we omit the implementation of the scopes for brevity.
  # Please see 'Scope patterns' for scope implementation details.
  scope :search_query, lambda { |query|
    # Filters students whose name or email matches the query
     # Searches the students table on the 'first_name' and 'last_name' columns.
      # Matches using LIKE, automatically appends '%' to each term.
      # LIKE is case INsensitive with MySQL, however it is case
      # sensitive with PostGreSQL. To make it work in both worlds,
      # we downcase everything.
      return nil  if query.blank?


      puts">>>>> query  #{query} >>>>>>>>>>"

      # condition query, parse into individual keywords
      terms = query.downcase.split(/\s+/)

      puts">>>>> terms after split #{terms}>>>>>>>>>>"

      # replace "*" with "%" for wildcard searches,
      # append '%', remove duplicate '%'s
      terms = terms.map { |e|
        (e.gsub('*', '%') + '%').gsub(/%+/, '%')
      }
      # configure number of OR conditions for provision
      # of interpolation arguments. Adjust this if you
      # change the number of OR conditions.
      num_or_conds = 1
      where(
        terms.map { |term|
          "(LOWER(libretum.nombre) LIKE ?)"
        }.join(' AND '),
        *terms.map { |e| [e] * num_or_conds }.flatten
      )

      
      puts">>>>> terms final #{terms}>>>>>>>>>>"
      puts">>>>> Entro el metodo search_query>>>>>>>>>>"

  }
  scope :sorted_by, lambda { |sort_key|
    # Sorts students by sort_key
  }
  scope :with_country_id, lambda { |country_ids|
    # Filters students with any of the given country_ids
  }
  scope :with_created_at_gte, lambda { |ref_date|
  }

  # This method provides select options for the `sorted_by` filter select input.
  # It is called in the controller as part of `initialize_filterrific`.
  def self.options_for_sorted_by
    [
      ['Name (a-z)', 'name_asc']#,
      #['Registration date (newest first)', 'created_at_desc'],
      #['Registration date (oldest first)', 'created_at_asc'],
      #['Country (a-z)', 'country_name_asc']
    ]
  end

  # app/models/country.rb
def self.options_for_select
  order('LOWER(name)').map { |e| [e.name, e.id] }
end


end
