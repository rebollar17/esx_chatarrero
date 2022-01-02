INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_chatarrero', 'Chatarrero', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_chatarrero', 'Chatarrero', 1)
;

INSERT INTO `jobs` (name, label) VALUES
	('chatarrero', 'Chatarrero')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('chatarrero',0,'recrue','Recrue',12,'{}','{}'),
	('chatarrero',1,'novice','Novice',24,'{}','{}'),
	('chatarrero',2,'experimente','Experimente',36,'{}','{}'),
	('chatarrero',3,'chief',"Chef d\'équipe",48,'{}','{}'),
	('chatarrero',4,'boss','Patron',0,'{}','{}')
;