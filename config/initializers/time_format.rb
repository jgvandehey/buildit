Time::DATE_FORMATS[:humanized_ago]  = ->(time) do
  st = Time.now.beginning_of_day
  nd = Time.now.end_of_day

  case 
  when time.between?(st + 1.day, nd + 1.day)
    "Today"
  when time.between?(st, nd)
    # "Today #{time.strftime('%H:%M')}"
    "Today"
  when time.between?(st - 1.day, nd - 1.day)
    # "Yesterday #{time.strftime('%H:%M')}"
    "Yesterday"
  when time.between?(st - 6.day, nd - 2.day)
    time.strftime('%B %d, %Y')
  else 
    time.strftime('%B %d, %Y')
  end
end