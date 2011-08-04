class Address < ActiveRecord::Base
  belongs_to :country
  STATES = {"AL" => {:view_select => ["Alabama","AL"],:map => 7},
            "AK" => {:view_select => ["Alaska","AK"],:map => 1},
            "AZ" => {:view_select => ["Arizona","AZ"],:map => 4},
            "AR" => {:view_select => ["Arkansas","AR"],:map => 7},
            "CA" => {:view_select => ["California","CA"],:map => 3},
            "CO" => {:view_select => ["Colorado","CO"],:map => 4},
            "CT" => {:view_select => ["Connecticut","CT"],:map => 7},
            "DE" => {:view_select => ["Delaware","DE"],:map => 7},
            "DC" => {:view_select => ["District of Columbia","DC"],:map => 7},
            "FL" => {:view_select => ["Florida","FL"],:map => 7},
            "GA" => {:view_select => ["Georgia","GA"],:map => 7},
            "HI" => {:view_select => ["Hawaii","HI"],:map => 1},
            "ID" => {:view_select => ["Idaho","ID"],:map => 3},
            "IL" => {:view_select => ["Illinois","IL"],:map => 7},
            "IN" => {:view_select => ["Indiana","IN"],:map => 7},
            "IA" => {:view_select => ["Iowa","IA"],:map => 7},
            "KS" => {:view_select => ["Kansas","KS"],:map => 4},
            "KY" => {:view_select => ["Kentucky","KY"],:map => 7},
            "LA" => {:view_select => ["Louisiana","LA"],:map => 7},
            "ME" => {:view_select => ["Maine","ME"],:map => 7},
            "MD" => {:view_select => ["Maryland","MD"],:map => 7},
            "MA" => {:view_select => ["Massachusetts","MA"],:map => 7},
            "MI" => {:view_select => ["Michigan","MI"],:map => 7},
            "MN" => {:view_select => ["Minnesota","MN"],:map => 7},
            "MS" => {:view_select => ["Mississippi","MS"],:map => 7},
            "MO" => {:view_select => ["Missouri","MO"],:map => 7},
            "MT" => {:view_select => ["Montana","MT"],:map => 4},
            "NE" => {:view_select => ["Nebraska","NE"],:map => 4},
            "NV" => {:view_select => ["Nevada","NV"],:map => 3},
            "NH" => {:view_select => ["New Hampshire","NH"],:map => 7},
            "NJ" => {:view_select => ["New Jersey","NJ"],:map => 7},
            "NM" => {:view_select => ["New Mexico","NM"],:map => 4},
            "NY" => {:view_select => ["New York","NY"],:map => 7},
            "NC" => {:view_select => ["North Carolina","NC"],:map => 7},
            "ND" => {:view_select => ["North Dakota","ND"],:map => 4},
            "OH" => {:view_select => ["Ohio","OH"],:map => 7},
            "OK" => {:view_select => ["Oklahoma","OK"],:map => 4},
            "OR" => {:view_select => ["Oregon","OR"],:map => 3},
            "PA" => {:view_select => ["Pennsylvania","PA"],:map => 7},
            "RI" => {:view_select => ["Rhode Island","RI"],:map => 7},
            "SC" => {:view_select => ["South Carolina","SC"],:map => 7},
            "SD" => {:view_select => ["South Dakota","SD"],:map => 4},
            "TN" => {:view_select => ["Tennessee","TN"],:map => 7},
            "TX" => {:view_select => ["Texas","TX"],:map => 4},
            "UT" => {:view_select => ["Utah","UT"],:map => 4},
            "VT" => {:view_select => ["Vermont","VT"],:map => 7},
            "VA" => {:view_select => ["Virginia","VA"],:map => 7},
            "WA" => {:view_select => ["Washington","WA"],:map => 3},
            "WV" => {:view_select => ["West Virginia","WV"],:map => 7},
            "WI" => {:view_select => ["Wisconsin","WI"],:map => 7},
            "WY" => {:view_select => ["Wyoming","WY"],:map => 4},
            "AA" => {:view_select => ["Armed Forces AA","AA"],:map => 0},
            "AE" => {:view_select => ["Armed Forces AE","AE"],:map => 0},
            "AP" => {:view_select => ["Armed Forces AP","AP"],:map => 0}}

  CA_PROVENCES = {'AB' => {:view_select =>
            ["Alberta",	                            "AB"], :map => 2},
            'BC' => {:view_select => 
            ["British Columbia",	                  "BC"], :map => 2},
            'MB' => {:view_select =>
            ["Manitoba",	                          "MB"], :map => 5},
            'NB' => {:view_select =>
            ["New Brunswick",	                      "NB"], :map => 9},
            'NF' => {:view_select =>
            ["Newfoundland and Labrador",	          "NF"], :map => 9},
            'NT' => {:view_select =>
            ["Northwest Territories",	              "NT"], :map => 2},
            'NS' => {:view_select =>
            ["Nova Scotia",	                        "NS"], :map => 9},
            'NU' => {:view_select =>
            ["Nunavut",	                            "NU"], :map => 5},
            'ON' => {:view_select =>
            ["Ontario",	                            "ON"], :map => 5},
            'PE' => {:view_select =>
            ["Prince Edward Island",	              "PE"], :map => 9},
            'QC' => {:view_select =>
            ["Quebec",	                            "QC"], :map => 9},
            'SK' => {:view_select =>
            ["Saskatchewan",	                      "SK"], :map => 2},
            'YK' => {:view_select =>
            ["Yukon",	                              "YK"], :map => 2}
          }
          def self.map_for(state)
            (STATES.merge CA_PROVENCES)[state][:map]
          end
end