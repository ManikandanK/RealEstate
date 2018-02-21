

def find_prime_number(l,r)
  find_list_of_prime_num = l<2 ? [1] : []
  (l..r).each do |num|
     find_list_of_prime_num << num if prime?(num)
  end

  #[1,3,5,7,11,13]
  prime_sum_count = 0  
  first_prime_num = find_list_of_prime_num[0]
  find_list_of_prime_num.each_with_index do |p_num1,i|
    sum_of_prime = find_list_of_prime_num[i..(find_list_of_prime_num.length)].inject(0){|sum,x| sum + x }
    prime_sum_count+=1 if prime?(sum_of_prime)
  end

  return prime_sum_count

end


def prime?(num)
  (2..num).each do |num_t|
     (num%num_t == 0)
  end
end
