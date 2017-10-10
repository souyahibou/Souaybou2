puts "Affichage de la somme de multiple de 5 et de 3de 0 à 1000";

somme=0;
ensemble=(0..1000).to_a;

puts "#{somme} #{ensemble}";

for i in ensemble
  if i%3==0 || i%5==0++
    somme+=i;
  end
end

print "Le résultats de la somme des multiples est #{somme}";


# print(sum(i for i in range(1, 1000) if i%3 == 0 or i%5 == 0))
