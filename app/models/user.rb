class User < ActiveRecord::Base
  validates_presence_of :firstname,  
    :message => ": Veuillez renseigner votre pr&eacute;nom"
  validates_presence_of :lastname,  
    :message => ": Veuillez renseigner votre nom"
  validates_presence_of :username,  
    :message => ": Veuillez renseigner votre pseudo"
  validates_presence_of :email,  
    :message => ": Veuillez renseigner votre adresse mail"
  validates_presence_of :zip,  
    :message => ": Veuillez renseigner votre code postal"
  validates_length_of :username, 
    :within => 3..15, 
    :too_long => ": Veuillez choisir un pseudo plus court (max 15 charact&egrave;res)", 
    :too_short => ": Veuillez choisir un pseudo plus long (min 3 charact&egrave;res)",
    :if => Proc.new { |a| a.username.size > 0}
  validates_format_of :username, 
    :with => /^\w+$/i, 
    :message => ": Votre pseudo ne peut contenir que des chiffres et des lettres",
    :if => Proc.new { |a| a.username.size > 0}
 validates_format_of :firstname, 
    :with => /^\w+$/i, 
    :message => ": Votre pr&eacute;nom ne peut contenir que des chiffres et des lettres",
    :if => Proc.new { |a| a.firstname.size > 0}
 validates_format_of :lastname, 
    :with => /^\w+$/i, 
    :message => ": Votre nom ne peut contenir que des chiffres et des lettres",
    :if => Proc.new { |a| a.lastname.size > 0}
  validates_presence_of :address,  
    :message => ": Veuillez renseigner votre adresse"
  validates_presence_of :city,  
    :message => ": Veuillez renseigner votre ville"
  validates_presence_of :picture,  
    :message => ": Veuillez s&eacute;lectionner une photo"
 	validates_uniqueness_of :username,
    :message => ": Le pseudo que vous avez choisi n'est pas disponible,<br/>veuillez en choisir un autre"
	validates_format_of :email, 
    :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/, 
    :message => ": L'adresse email n'est pas valide",
    :if => Proc.new { |a| a.email.size > 0}
	validates_format_of :zip, 
    :with => /^\d{5,6}$/, 
    :message => ": Le code postal n'est pas valide",
    :if => Proc.new { |a| a.zip.size > 0}
  validates_presence_of :saloon,  
    :message => ": Veuillez renseigner le nom votre salon de coiffure", 
    :if => Proc.new { |a| a.category.to_s.eql?('pro') }
  validates_presence_of :salooncity,  
    :message => ": Veuillez renseigner la ville votre salon de coiffure", 
    :if => Proc.new { |a| a.category.to_s.eql?('pro') }
  validates_presence_of :saloonaddr,  
    :message => ": Veuillez renseigner l'adresse de votre salon de coiffure", 
    :if => Proc.new { |a| a.category.to_s.eql?('pro') }
  validates_format_of :saloonzip, 
    :with => /^\d{5,6}$/, 
    :message => ": le code postal de votre salon de coiffure n'est pas valide", 
    :if => Proc.new { |a| a.category.to_s.eql?('pro') }
end
