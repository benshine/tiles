class Board < ActiveRecord::Base
  store :tiles, accessors: [ :at ]
end
