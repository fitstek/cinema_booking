def seat_in( options = {} )
  hall.rows[options.fetch(:row)].seats[options.fetch(:seat)]
end
