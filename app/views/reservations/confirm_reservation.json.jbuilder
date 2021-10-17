json.array! @reservations do |reservation|
  json.id reservation.id
  json.title reservation.title_for_staff
  json.start reservation.start_time
  json.end reservation.end_time
end
