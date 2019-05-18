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
  # Returns an array
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

def remove_pet_by_name(pet_shop, name)
  pet_shop[:pets].delete_if { |pet|
    pet[:name] == name
  }
end

def add_pet_to_stock(pet_shop, new_pet)
  pet_shop[:pets].push(new_pet)
end

def customer_cash(customer)
  return customer[:cash]
end

def remove_customer_cash(customer, amount)
  customer[:cash] -= amount
end

def customer_pet_count(customer)
  return customer[:pets].count
end

def add_pet_to_customer(customer, new_pet)
  customer[:pets].push(new_pet)
end

# End of mandatory tests - tea-time!
# 17 successful runs

def customer_can_afford_pet(customer, new_pet)
  if customer[:cash] >= new_pet[:price]
    return true
  else
    return false
  end
end

# Integration Test additions

def sell_pet_to_customer(pet_shop, pet, customer)
  if pet != nil
    if   customer_can_afford_pet(customer, pet)
      add_pet_to_customer(customer, pet)
      increase_pets_sold(pet_shop, 1)
      remove_customer_cash(customer, pet[:price])
      add_or_remove_cash(pet_shop, pet[:price])
      remove_pet_by_name(pet_shop, name)
    end
  end
end
