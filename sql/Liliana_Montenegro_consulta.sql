select v.registration_code, v.purchase_date, v.kms, vm.model_description, b.brand_name, bg.group_name, c.color_name, p.idpolicie, ic.company_name

from fleet_management.vehicles_models vm, fleet_management.vehicles v, fleet_management.brands b, fleet_management.brand_groups bg, fleet_management.colors c, fleet_management.policies p, fleet_management.insurance_company ic 

where v.idmodel = vm.idmodel 
	and b.idbrand = vm.idbrand 
	and bg.idbrand_group = b.idbrand_group 
	and c.idcolor = v.idcolor 
	and p.idvehicle = v.idvehicle
	and ((ic.idcompany = p.idcompany) and (p.end_date isnull)) 
	
	