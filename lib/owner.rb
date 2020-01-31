class Owner

  attr_reader :name, :species

  @@all = []
  
  def initialize(name)
    @name = name
    @species = "human"

    @@all << self
  end

  def say_species
    "I am a #{self.species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all.clear
  end

  def cats
    Cat.all.select{|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select{|dog| dog.owner == self}
  end

  def buy_cat(cat_name)
  #  boogie = Cat.all.find{|cat| cat.name == cat_name} 
  #  boogie.owner = self
    Cat.new(cat_name, self)
  end

  def buy_dog(dog_name)
    # penny = Dog.all.find{|dog| dog.name == dog_name}
    # if penny
    #   penny.owner = self
    # else
    Dog.new(dog_name, self)
    # end
  end

  def walk_dogs
    self.dogs.each{|dog| dog.mood = "happy"}
  end

  def feed_cats
    self.cats.each{|cat| cat.mood = "happy"}
  end

  def sell_pets
    self.dogs.each{|dog| 
      dog.mood = "nervous"
      dog.owner = nil
    }
    self.cats.each{|cat| 
      cat.mood = "nervous"
      cat.owner = nil
    }
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end