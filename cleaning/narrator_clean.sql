select * from audible_uncleaned
update audible_uncleaned
set narrator = replace(narrator,'Narratedby:','')
