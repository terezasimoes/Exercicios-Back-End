mongoimport --db superheroes --collection heroes superheroes.json
> use superheroes
switched to db superheroes
> show collections
heroes
> db.heroes.count()
734
db.heroes.find({}).limit(5).pretty()

-- Exercício 1: Inspecione um documento para que você se familiarize com eles. Entenda os campos e os níveis existentes no documento escolhido.

-- Exercício 2: Selecione todos os super-heróis menores do que 1.80m de altura. Lembre-se de que essa informação está gravada em centímetros.
db.heroes.find( { "aspects.height": { $lt: 180 } } ).pretty()

-- Exercício 3: Retorne o total de super-heróis menores que 1.80m.
db.heroes.count( { "aspects.height": { $lt: 180 } } )

-- Exercício 4: Retorne o total de super-heróis com até 1.80m.
db.heroes.count( { "aspects.height": { $lte: 180 } } )

-- Exercício 5: Selecione um super-herói com 2.00m ou mais de altura.
db.heroes.findOne( { "aspects.height": { $gte: 200 } } )

-- Exercício 6: Retorne o total de super-heróis com 2.00m ou mais.
db.heroes.count( { "aspects.height": { $gte: 200 } } )

-- Exercício 7: Selecione todos os super-heróis que têm olhos verdes.
db.heroes.count( { "aspects.eyeColor": "green"} )
db.heroes.find( { "aspects.eyeColor": "green"} ).pretty()

-- Exercício 8: Retorne o total de super-heróis com olhos azuis.
db.heroes.count( { "aspects.eyeColor": { $eq: "blue"} } )

-- Exercício 9: Utilizando o operador $in, selecione todos os super-heróis com cabelos pretos ou carecas ("No Hair").
db.heroes.find( { "aspects.hairColor": { $in: ["black", "No Hair"] }}).pretty()

-- Exercício 10: Retorne o total de super-heróis com cabelos pretos ou carecas ("No Hair").
db.heroes.count( { "aspects.hairColor": { $in: ["black", "No Hair"] }})

-- Exercício 11: Retorne o total de super-heróis que não tenham cabelos pretos ou não sejam carecas.
db.heroes.count( { "aspects.hairColor": { $nin: ["black", "No Hair"] }})

-- Exercício 12: Utilizando o operador $not, retorne o total de super-heróis que não tenham mais de 1.80m de altura.
db.heroes.count( { "aspects.height": {$not: { $lte: 180 }} } )

-- Exercício 13: Selecione todos os super-heróis que não sejam humanos e não sejam maiores do que 1.80m.
db.heroes.find({$nor:[ {"race":"Human"}, {"aspects.height":{$gt: 180}}]}).pretty()

-- Exercício 14: Selecione todos os super-heróis com 1.80m ou 2.00m de altura e que sejam publicados pela Marvel Comics.
db.heroes.find({$and:[{$or: [{ "aspects.height": {$in: [ 200, 180]} } ] }, {publisher: "Marvel Comics" } ] } ).pretty()
db.heroes.find({$and:[{$or: [{"aspects.height": 180}, { "aspects.height": 200 } ] }, {publisher: "Marvel Comics" } ] } ).pretty()

-- Exercício 15: Selecione todos os super-heróis que pesem entre 80kg e 100kg, sejam Humanos ou Mutantes, e não sejam publicados pela DC Comics.
db.heroes.find( {$and: [{publisher: {$ne: "DC Comics"  }},
{$or: [{race: {$in:["Human", "Mutant" ] }}  ] },
{"aspects.weight": { $gte: 80, $lte: 100 } }   ]  } ).pretty()

-- Exercício 16: Retorne o total de documentos que não contêm o campo race.
db.heroes.count({ race: { $exists: false } })

-- Exercício 17: Retorne o total de documentos que contêm o campo hairColor.
db.heroes.count({ "aspects.hairColor":  { $exists: 1 } })

-- Exercício 18: Remova apenas um documento publicado pela Sony Pictures.
 db.heroes.deleteOne( { publisher: "Sony Pictures" } )

-- Exercício 19: Remova todos os documentos publicados pelo George Lucas.
db.heroes.deleteMany(  { publisher: "George Lucas" } )
