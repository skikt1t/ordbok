
INSERT INTO categories (id, name) VALUES
(1, 'Deictic (personal)'),


(2, 'Deictic (spatial)'),
(3, 'People and kinship'),
(4, 'Animals'),
(5, 'Plants'),
(6, 'Food'),

(8, 'Body part'),

(10, 'Action (physical)'),
(11, 'Action (sensory)'),
(12, 'Action (mental)'),
(13, 'Action (social)'),

(14, 'Time'),
(15, 'Number'),

(16, 'Property (state)'),
(17, 'Property (qualitative)'),
(18, 'Property (quantitative)'),
(19, 'Property (physical)'),

(20, 'Relation'),
(21, 'Interrogative'),

(23, 'Place'), **

(25, 'Nature'), **
(26, 'Object'),
(27, 'Concept');





INSERT INTO concepts (id, desc, cat_id) VALUES
(1, 'I', 1),
(2, 'you (singular)', 1),
(3, 'he', 1),
(4, 'we', 1),
(5, 'you (plural)', 1),
(6, 'they', 1),

(7, 'this', 2),
(8, 'that', 2),
(9, 'here', 2),
(10, 'there', 2),

(11, 'who', 21),
(12, 'what', 21),
(13, 'where', 21),
(14, 'when', 21),
(15, 'how', 21),

(16, 'not', 16),

(17, 'all', 18),
(18, 'many', 18),
(19, 'some', 18),
(20, 'few', 18),
(21, 'other', 18),

(22, 'one', 15),
(23, 'two', 15),
(24, 'three', 15),
(25, 'four', 15),
(26, 'five', 15),

(27, 'big', 19),
(28, 'long', 19),
(29, 'wide', 19),
(30, 'thick', 19),
(31, 'heavy', 19),
(32, 'small', 19),
(33, 'short', 19),
(34, 'narrow', 19),
(35, 'thin', 19),

(36, 'woman', 3),
(37, 'man (adult male)', 3),
(38, 'man (human being)', 3),
(39, 'child', 3),
(40, 'wife', 3),
(41, 'husband', 3),
(42, 'mother', 3),
(43, 'father', 3),

(44, 'animal', 4),
(45, 'fish', 4),
(46, 'bird', 4),
(47, 'dog', 4),
(48, 'louse', 4),
(49, 'snake', 4),
(50, 'worm', 4),

(51, 'tree', 5),

(52, 'forest', 25),

(53, 'stick', 26),

(54, 'fruit', 6),

(55, 'seed', 5),
(56, 'leaf', 5),
(57, 'root', 5),
(58, 'bark (of a tree)', 5),
(59, 'flower', 5),
(60, 'grass', 5),

(61, 'rope', 26),

(62, 'skin', 8),

(63, 'meat', 6),

(64, 'blood', 8),
(65, 'bone', 8),
(66, 'fat', 8),

(67, 'egg', 6),

(68, 'horn', 4),
(69, 'tail', 4),
(70, 'feather', 4),

(71, 'hair', 8),
(72, 'head', 8),
(73, 'ear', 8),
(74, 'eye', 8),
(75, 'nose', 8),
(76, 'mouth', 8),
(77, 'tooth', 8),
(78, 'tongue', 8),
(79, 'fingernail', 8),
(80, 'foot', 8),
(81, 'leg', 8),
(82, 'knee', 8),
(83, 'hand', 8),

(84, 'wing', 4),

(85, 'belly', 8),
(86, 'guts', 8),
(87, 'neck', 8),
(88, 'back', 8),
(89, 'breast', 8),
(90, 'heart', 8),
(91, 'liver', 8),

(92, 'to drink', 10),
(93, 'to eat', 10,
(94, 'to bite', 10),
(95, 'to suck', 10),
(96, 'to spit', 10),
(97, 'to vomit', 10),
(98, 'to blow', 10),
(99, 'to breathe', 10),

(100, 'to laugh', 13),

(101, 'to see', 11),
(102, 'to hear', 11),

(103, 'to know', 12),
(104, 'to think', 12),

(105, 'to smell', 11),

(106, 'to fear', 12),

(107, 'to sleep', 10),
(108, 'to live', 10),
(109, 'to die', 10),

(110, 'to kill', 13),
(111, 'to fight', 13),

(112, 'to hunt', 10),
(113, 'to hit', 10),
(114, 'to cut', 10),
(115, 'to split', 10),
(116, 'to stab', 10),
(117, 'to scratch', 10),
(118, 'to dig', 10),
(119, 'to swim', 10),
(120, 'to fly', 10),
(121, 'to walk', 10),
(122, 'to come', 10),
(123, 'to lie (as in a bed)', 10),
(124, 'to sit', 10),
(125, 'to stand', 10),
(126, 'to turn (intransitive)', 10),
(127, 'to fall', 10),

(128, 'to give', 13),

(129, 'to hold', 10),
(130, 'to squeeze', 10),
(131, 'to rub', 10),
(132, 'to wash', 10),
(133, 'to wipe', 10),
(134, 'to pull', 10),
(135, 'to push', 10),
(136, 'to throw', 10),
(137, 'to tie', 10),
(138, 'to sew', 10),

(139, 'to count', 12),

(140, 'to say', 13),
(141, 'to sing', 13),
(142, 'to play', 13),

(143, 'to float', 10),
(144, 'to flow', 10),
(145, 'to freeze', 10),
(146, 'to swell', 10),

(147, 'sun', 25),
(148, 'moon', 25),
(149, 'star', 25),
(150, 'water', 25),
(151, 'rain', 25),
(152, 'river', 25),
(153, 'lake', 25),
(154, 'sea', 25),

(155, 'salt', 6),

(156, 'stone', 26),

(157, 'sand', 25),
(158, 'dust', 25),
(159, 'earth', 25),
(160, 'cloud', 25),
(161, 'fog', 25),
(162, 'sky', 25),
(163, 'wind', 25),
(164, 'snow', 25),
(165, 'ice', 25),
(166, 'smoke', 25),
(167, 'fire', 25),
(168, 'ash', 25),

(169, 'to burn', 10),

(170, 'road', 23),
(171, 'mountain', 23),

(172, 'red', 17),
(173, 'green', 17),
(174, 'yellow', 17),
(175, 'white', 17),
(176, 'black', 17),
(177, 'night', 14),
(178, 'day', 14),
(179, 'year', 14),
(180, 'warm', 19),
(181, 'cold', 19),
(182, 'full', 18),
(183, 'new', 16),
(184, 'old', 16),
(185, 'good', 17),
(186, 'bad', 17),
(187, 'rotten', 17),
(188, 'dirty', 17),
(189, 'straight', 19),
(190, 'round', 19),
(191, 'sharp (as a knife)', 19),
(192, 'dull (as a knife)', 19),
(193, 'smooth', 19),
(194, 'wet', 19),
(195, 'dry', 19),
(196, 'correct', 17),
(197, 'near', 19),
(198, 'far', 19),
(199, 'right', 20),
(200, 'left', 20),
(201, 'at', 20),
(202, 'in', 20),
(203, 'with', 20),
(204, 'and', 20),
(205, 'if', 20),
(206, 'because', 20),
(207, 'name', 27);
