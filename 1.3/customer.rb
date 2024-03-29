# -*- coding: utf-8 -*-
class Customer
  attr_reader :name

  def initialize(name)
    @name = name
    @rentals = []
  end

  def add_rental(arg)
    @rentals << arg
  end

  def statement
    total_amount, frequent_renter_points = 0, 0
    result = "Rental Record for #{@name}\n"

    @rentals.each do |element|
      # レンタルポイントを加算
      frequent_renter_points += 1
      # 新作２日間レンタルでボーナス点を加算
      if element.movie.price_code == Movie.NEW_RELEASE && element.days_rented > 1
        frequent_renter_points += 1
      end

      # このレンタルの料金を表示
      result += "\t" + element.movie.title + "\t" + element.charge.to_s + "\n"
      total_amount += element.charge
    end

    result += "Amount owed is #{total_amount}\n"
    result += "You earned #{frequent_renter_points} frequent renter points"
  end
end
