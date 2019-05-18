def pet_shop_name(pet_shop)
  return(pet_shop[:name])
end

def total_cash(pet_shop)
  return(pet_shop[:admin][:total_cash])
end

def add_or_remove_cash(pet_shop, amount)
  pet_shop[:admin][:total_cash] += amount
end

def pets_sold(pet_shop)
  return(pet_shop[:admin][:pets_sold])
end

def increase_pets_sold(pet_shop, num_pets_sold)
  pet_shop[:admin][:pets_sold] += num_pets_sold
end

def stock_count(pet_shop)
  return(pet_shop[:pets].count)
end

def pets_by_breed(pet_shop, breed)

  pets_of_breed = []

  pet_shop[:pets].each { |pet|
    if pet[:breed] == breed
      pets_of_breed.push(pet)
    end
  }
  return(pets_of_breed)
end

def find_pet_by_name(pet_shop, name)
  pet_shop[:pets].each { |pet|
    if pet[:name] == name
      return pet
    end
  }
  return nil
end
