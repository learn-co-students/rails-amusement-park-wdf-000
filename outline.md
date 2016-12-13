User migration
    name:string
    password:string
    nausea:integer
    happines:integer
    tickets:integer
    height:integer
    admin:boolean default: false

User model
    has_many :rides
    has_many :attractions, through: :rides
    validates_presence_of :name, password, tickets, happiness, nausea, height

Attraction migration
    name:string
    tickets:integer
    nausea_rating:integer
    happiness_rating:integer
    min_height:integer

Attraction model
    has_many :rides
    has_many :users, through: :rides
    validates name, tickets, min_height, nausea_rating, happiness_rating

Ride migration
    user_id:integer
    attraction_id:integer

Ride model
    belongs_to :user
    belongs_to :attraction
    validates_presence_of :user_id, :attraction_id