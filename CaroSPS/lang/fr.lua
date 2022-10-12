-- French Version

local L = {}

	L.SI_BINDING_NAME_CSPS_SHOW = "Show Skill Point Saver"
	L.SI_BINDING_NAME_CSPS_CPHK1 = "Profil de barre PC raccourci 1"
	L.SI_BINDING_NAME_CSPS_CPHK2 = "Profil de barre PC raccourci 2"
	L.SI_BINDING_NAME_CSPS_CPHK3 = "Profil de barre PC raccourci 3"
	L.SI_BINDING_NAME_CSPS_CPHK4 = "Profil de barre PC raccourci 4"
	L.SI_BINDING_NAME_CSPS_CPHK5 = "Profil de barre PC raccourci 5"
	L.SI_BINDING_NAME_CSPS_CPHK6 = "Profil de barre PC raccourci 6"
	L.SI_BINDING_NAME_CSPS_CPHK7 = "Profil de barre PC raccourci 7"
	L.SI_BINDING_NAME_CSPS_CPHK8 = "Profil de barre PC raccourci 8"
	L.SI_BINDING_NAME_CSPS_CPHK9 = "Profil de barre PC raccourci 9"
	L.SI_BINDING_NAME_CSPS_CPHK10 = "Profil de barre PC raccourci 10"
	L.SI_BINDING_NAME_CSPS_CPHK11 = "Profil de barre PC raccourci 11"
	L.SI_BINDING_NAME_CSPS_CPHK12 = "Profil de barre PC raccourci 12"
	L.SI_BINDING_NAME_CSPS_CPHK13 = "Profil de barre PC raccourci 13"
	L.SI_BINDING_NAME_CSPS_CPHK14 = "Profil de barre PC raccourci 14"
	L.SI_BINDING_NAME_CSPS_CPHK15 = "Profil de barre PC raccourci 15"
	L.SI_BINDING_NAME_CSPS_CPHK16 = "Profil de barre PC raccourci 16"
	L.SI_BINDING_NAME_CSPS_CPHK17 = "Profil de barre PC raccourci 17"
	L.SI_BINDING_NAME_CSPS_CPHK18 = "Profil de barre PC raccourci 18"
	L.SI_BINDING_NAME_CSPS_CPHK19 = "Profil de barre PC raccourci 19"
	L.SI_BINDING_NAME_CSPS_CPHK20 = "Profil de barre PC raccourci 20"
	
	-- General UI
	L.CSPS_MyWindowTitle = "Caro's Skill Point Saver"
	
	L.CSPS_Tooltiptext_Close = "Fermez cette fenêtre"
	L.CSPS_Tooltiptext_Read = "Lire les données actuelles"
	L.CSPS_Tooltiptext_Save = "Enregistrer les données affichées"
	L.CSPS_Tooltiptext_Load = "Charger les données enregistrées"
	L.CSPS_Tooltiptext_Apply = "Appliquer les données chargées"
	L.CSPS_Tooltiptext_Help = "Aide!"
	L.CSPS_Tooltiptext_CP1 = "Voulez-vous appliquer les points de champion bleu ?"
	L.CSPS_Tooltiptext_CP2 = "Voulez-vous appliquer les points de champion rouges ?"
	L.CSPS_Tooltiptext_CP3 = "Voulez-vous appliquer les points de champion vert ?"
	
	L.CSPS_Tooltiptext_ApplyCP = "Appliquer les points de champion"
	L.CSPS_Tooltiptext_ATTR = "Appliquer les points d'attribut"
	L.CSPS_Tooltiptext_Sk = "Appliquer les points de compétence"
	
	L.CSPS_Tooltiptext_MinusSk = "Descendre / supprimer cette compétence"
	L.CSPS_Tooltiptext_PlusSk = "Augmenter / ajouter cette compétence"
	L.CSPS_Tooltiptext_Optional = "Afficher les options supplémentaires"
	L.CSPS_Tooltiptext_SkIcon = "Faites glisser la compétence pour la placer sur la barre de raccourcis.."
	L.CSPS_Tooltiptext_SrcCombo	 = "Sélectionnez un format pour l'importation / l'exportation."
	L.CSPS_Tooltiptext_AddProfile = "Ajouter un profil..."
	L.CSPS_Tooltiptext_RenameProfile = "Renommer le profil..."
	L.CSPS_Tooltiptext_DeleteProfile = "Supprimer le profil..."
	L.CSPS_Tooltiptext_ProfileCombo = "Sélectionnez un profil pour charger / enregistrer vos données..."
	L.CSPS_Tooltiptext_MinusSkType = "Supprimer toutes les compétences de ce type."
	L.CSPS_Tooltiptext_MinusSkLine = "Supprimer toutes les compétences de cette ligne de compétences."
	L.CSPS_Tooltiptext_PlusSkLine = " Ajoutez toutes les compétences passives et placez-les à leur rang le plus élevé"
	L.CSPS_Tooltiptext_MinusAttr = "Supprimer le point d'attribut (maintenez Shift pour 10 points)"
	L.CSPS_Tooltiptext_PlusAttr = "Ajouter un point d'attribut (maintenez Shift pour 10 points)"
	L.CSPS_Tooltiptext_SaveProfile = "Sauvegarder ce profil..."
	L.CSPS_Tooltiptext_CPProfile = "Profils PC" -- also used for the profile-section title
	L.CSPS_Tooltiptext_PlusCP = "Ajouter un point de champion (maintenez Shift pour 10 points / étape suivante)"
	L.CSPS_Tooltiptext_MinusCP = "Retirez le point de champion (maintenez Shift pour 10 points / étape suivante)"
	L.CSPS_Tooltiptext_CpHbHk = "Cliquez ici pour changer le raccourci clavier de ce profil."
	L.CSPS_Tooltip_CPBar = "Faites glisser et déposez une compétence de la liste pour l'insérer ici. Utilisez le clic droit pour supprimer une compétence mise ."
	L.CSPS_Tooltip_CPPUpdate = "Dernière mise à jour: <<2>>/<<1>>/<<3>>"
	L.CSPS_Tooltip_CPPWebsite = "Pour les mises à jour les plus récentes, visitez:\n<<1>>"
	L.CSPS_Tooltip_CPCustomBar = "Indique si une barre pour les points de champion mis doit être affichée dans le cadre du HUD"
	L.CSPS_Tooltip_CPCustomIcons = "Indique si l'addon doit utiliser des icônes personnalisées pour les points de champion slottables"
	
	L.CSPS_Tooltip_ReverseLabel = "L'ordre standard d'importation du texte est: Numéro, Nom.\nCochez cette case pour inverser l'ordre en: Nom, Numéro "
	L.CSPS_Tooltip_CapLabel = "Si cette case est cochée, l'addon n'essaiera pas d'importer plus de points de champion que ce qui est disponible sur ce compte."
	L.CSPS_Tooltip_SelectBarProfile = "Sélectionnez une barre de profil"
	L.CSPS_Tooltip_ImpExp_CleanUp = "Cela supprimera tous les caractères spéciaux du texte. Il supprimera également toutes les paires de nombres séparées par des tirets qui peuvent être utilisées pour indiquer les plages de points de champion nécessaires.  (ex. sur AlcastHQ) mais peut provoquer des erreurs dans le processus d'importation."
	
	L.CSPS_Tooltip_AddBind1 = "Si vous ajoutez cette condition, à chaque fois que vous chargez et sélectionné Dressing room, le groupe actuel sera automatiquement appliqué."
	L.CSPS_Tooltip_AddBind2 = "Si vous ajoutez cette condition, à chaque fois que vous chargez et sélectionné alpha gear, le groupe actuel sera automatiquement appliqué."
	L.CSPS_Tooltip_AddBind3 = "Si vous ajoutez cette condition, chaque fois que vous entrez l'emplacement sélectionné, le groupe actuel sera automatiquement appliqué."
	
	L.CSPS_Tooltip_CPAutoOpen = "Cochez cette case, si l'addon doit être affiché à chaque fois que vous entrez dans la fenêtre de points de champion."
	
	L.CSPS_Tooltip_AddConnection = "Se connecter au profil actuel"
	L.CSPS_Tooltip_RemoveConnection = "Supprimer la connexion au profil actuel"
	L.CSPS_Tooltip_ShowConnection = "Connecté au profil de points de champion: %s\n\n Les modifications apportées à cette discipline de champion peuvent être appliquées à votre personnage mais pas enregistrées dans le profil de construction actuel. Le chargement de la construction essaiera automatiquement de charger le profil de points de champion connecté.\n\n|t26:26:esoui/art/miscellaneous/icon_rmb.dds|t:Supprimer la connexion"	
	
	L.CSPS_Tooltiptext_DeleteBinding = "Supprimer la liaison"
	
	L.CSPS_Tooltiptext_LoadAndApply = "Charger et appliquer"
	L.CSPS_MORPH = "<<1[Pas de Morph/Morph 1/Morph $d]>>"
	L.CSPS_MyRank = "Rang %s"
	
	L.CSPS_CP_RED = "PC Rouge"
	L.CSPS_CP_BLUE = "PC Bleu"
	L.CSPS_CP_GREEN = "PC Vert"
	
	L.CSPS_TxtCp = "PC"	-- forme la plus courte pour les points de champion
	L.CSPS_TxtCpOld = "PC 1.0"
	L.CSPS_TxtCpNew = "PC 2.0"
	--	Errormessages (chat)
	L.CSPS_NoSavedData = "Aucune donnée enregistrée pour le moment."
	L.CSPS_TxtLangDiff = "La langue du jeu a été modifiée. Migration des données pour les types de compétences classés par ordre alphabétique ."
	L.CSPS_Txt_NewProfile = "Profil " -- pour les noms numérotés
	L.CSPS_Txt_NewProfile2 = "Nouveau profil" -- pour les noms non numérotés
	L.CSPS_Txt_StandardProfile = "Standard"
	
	L.CSPS_CPP_Name = "Nom"
	L.CSPS_CPP_Points = "Points"
	L.CSPS_CPP_Role = " Rôle "
	L.CSPS_CPP_Tank = "Tank"
	L.CSPS_CPP_Source = "Source"
	L.CSPS_CPP_Hotkey = "Rac.clav"
	L.CSPS_CPP_BtnCustAcc = "Personnalisé\n(Compte)"
	L.CSPS_CPP_BtnCustChar = "Personnalisé\n(Perso)"
	L.CSPS_CPP_BtnImportText = "Importation du texte"
	L.CSPS_CPP_BtnPresets = "Préconfigurations"
	L.CSPS_CPP_BtnHotBar = "Racc clavier uniquement"
	L.CSPS_CPApplied = "Points de champion appliqués avec succès"
	L.CSPS_CPNoChanges = "Aucun changement de point de champion n'est nécessaire"
	L.CSPS_CPBar_GroupHeading = "Groupe actuel: %s/%s"
	L.CSPS_CPBar_GroupKeybind = "Association de touches actuelle: %s"
	L.CSPS_CPBar_Manage = "Gérer barre de champion"
	
	L.CSPS_CPLoadGroup = "Chargement du Groupe:"	
	
	L.CSPS_CPValueTooHigh = "La valeur est supérieure au maximum pour cette compétence."
	
	
	L.CSPS_CPPDescr_JoaTFarming = "Ce préréglage est optimisé pour être utilisé avec l'addon  \" Jack of all Trades \" et se concentre sur les ressources agricoles (le combat, la pêche et le crime sont ajoutés à un niveau de PC plus élevé)."
	L.CSPS_CPPDescr_JoaTFishing = "Ce préréglage est optimisé pour être utilisé avec l'addon \" Jack of all Trades \" et se concentre sur la pêche (l'agriculture, le combat et le crime sont ajoutés à un niveau de PC plus élevé)."
	
L.CSPS_CPPDescr_JoaTThieving = "Ce préréglage est optimisé pour être utilisé avec l'addon \" Jack of all Trades \" et se concentre sur le crime (l'agriculture, le combat et la pêche sont ajoutés à un niveau de PC plus élevé)."
	L.CSPS_CPPDescr_CombatFocus = "Ce préréglage est axé sur les points de champion verts liés au combat."

	L.CSPS_StrictOrder = "Ordre strict"
	L.CSPS_Tooltiptext_StrictOrder = "Cochez cette case pour laisser l'addon arrêter de charger un préréglage à la première compétence pour laquelle vous n'avez pas assez de points au lieu de vérifier si l'une des compétences suivantes peut être chargée à la place. Le choix de cette option peut vous laisser avec plus de points non dépensés, mais peut vous faire économiser les frais de re spécialisations de 3000 pièces d'or plus tard."
	L.CSPS_CPPCurrentlyApplied = "Actuellement appliqué:  <<1[Aucun point /1 point/$d points]>>"

	L.CSPS_MSG_ApplyClosing = "Vous semblez avoir des changements non appliqués dans vos points de champion. Assurez-vous de ne pas oublier de les appliquer."
	
	L.CSPS_CPBar_LocTrial = "Raid/Arène"
	L.CSPS_CPBar_LocCurr = "Localisation actuelle"
	L.CSPS_CPBar_LocType = "Par type"
	L.CSPS_CPBar_LocName = "Emplacement actuel (nom exact)"
	L.CSPS_CPBar_Location = "Lieu"
		
	L.CSPS_CPBar_SelectGroup1 = "Sélectionnez une page..." -- Dressing room
	L.CSPS_CPBar_SelectGroup2 = "Sélectionnez un profil..." -- Alpha gear
	L.CSPS_CPBar_SelectGroup3 = "choisissez une catégorie..." -- Lieu
	
	L.CSPS_CPBar_SelectSet1 = "Sélectionnez un ensemble..." -- Dressing room
	L.CSPS_CPBar_SelectSet2 = "Sélectionnez une version..." -- Alpha gear
	L.CSPS_CPBar_SelectSet3 = "Sélectionnez un emplacement..." -- Lieu
	
	L.CSPS_CPBar_AddBindings = "Ajouter des conditions pour que ce groupe soit appliqué automatiquement..."
	L.CSPS_CPBar_AddBind = "Ajouter une liaison"
	L.CSPS_CPBar_BindingsHeader = "Conditions existantes pour ce groupe:"
	
	L.CSPS_CPBar_EditProfiles = "Modifier les profils"
	L.CSPS_CPBar_Apply = "Charger et appliquer ce groupe..."
	L.CSPS_CPBar_NoDR = "Vous n'avez pas non plus <<1>> installé ou vous avez une version qui n'est pas prise en charge pour le moment."
	

	L.CSPS_Help_Oversection1 = "Fonctions générales" 
	L.CSPS_Help_Head1 = "Sauvegarde des données:"  
	L.CSPS_Help_Sect1 = "1. Cliquez sur 'Lire les données actuelles' (|t28:28:esoui/art/help/help_tabicon_feedback_up.dds|t).\n2. Si vous le souhaitez, cliquez sur le plus / moins à côté de vos compétences pour les ajuster (vous pourrez également modifier vos compétences plus tard.)\n3. Cliquez sur 'Enregistrer les données affichées'. (|t28:28:esoui/art/mail/mail_tabicon_compose_up.dds|t)\nToutes les compétences, attributs et CP sont enregistrés."
	L.CSPS_Help_Head2 = "Chargement des données enregistrées:"
	L.CSPS_Help_Sect2 = "1. Cliquez sur 'Charger les données enregistrées'. (|t28:28:esoui/art/mail/mail_tabicon_inbox_up.dds|t)\n2. En option, cliquez sur le plus/moins à côté de vos compétences pour les ajuster.\n3. Cliquez sur l'un des boutons d'application (|t28:28:esoui/art/buttons/accept_up.dds|t) au sommet pour appliquer vos compétences, attributs ou points de champion.\nVos données sélectionnées sont appliquées.\nLorsque vous appliquez des compétences, veuillez noter que vos barres de raccourcis doivent être appliquées séparément. Assurez-vous que vos barres de raccourcis sont affichées en bas de l'addon. Sinon, cliquez sur 'Options' (coin supérieur droit, |t28:28:esoui/art/skillsadvisor/advisor_tabicon_settings_up.dds|t) et activez les barres de raccourcis. Cliquez ensuite sur Appliquer en bas de l'addon (entre les deux barres de raccourcis, |t28:28:esoui/art/buttons/accept_up.dds|t) et changer votre barre."
	L.CSPS_Help_Head3 = "Créer des profils"
	L.CSPS_Help_Sect3 = "Vous pouvez enregistrer toutes vos données (compétences, attributs, points de champion) dans différents profils.\n1. Choisissez un profil existant via le menu déroulant dans le coin supérieur gauche de la fenêtre de l'addon ou créez un nouveau profil en cliquant sur le bouton plus juste à côté.\n2. En plus du profil standard, vous êtes libre de renommer et de supprimer tous vos profils créés (|t28:28:esoui/art/buttons/edit_up.dds|t , |t28:28:esoui/art/buttons/minus_up.dds|t).\n3. Pour garder vos données enregistrées aussi petites que possible, il est recommandé de n'enregistrer que ces compétences dans un profil qui devrait réellement être modifié lors de son application. Utilisez les boutons moins correspondants pour supprimer des lignes de compétences entières de votre profil .\n4. N'oubliez pas de sauvegarder votre profil une fois que vous avez fini de le modifier. (|t28:28:esoui/art/mail/mail_tabicon_compose_up.dds|t)"
	L.CSPS_Help_Head4 = "Application de profils / respécification"
	L.CSPS_Help_Sect4 = "Pour appliquer un profil avec des points de compétence ou d'attribut, allez d'abord dans un sanctuaire et dépensez de l'or pour redonner vos compétences / attributs.\nDans la plupart des cas, vous n'aurez pas à réinitialiser toutes vos compétences - les évolutions devraient suffire. Restez en mode de reconsécration pour appliquer vos modifications. Confirmez vos modifications dans la fenêtre des compétences eso une fois que vous avez terminé. Veuillez noter que l'addon traitera vos modifications comme des conflits tant que le jeu est toujours en mode respécification et que les modifications n'ont pas été confirmées ."
	L.CSPS_Help_Oversection5 = "Points-\nChampion"
	L.CSPS_Help_Head5 = "Points de champion en général"
	L.CSPS_Help_Sect5 = "Vous pouvez enregistrer vos points de champion avec vos compétences et vos attributs. Vous avez également la possibilité de créer des profils de champion séparés .\n1. Cliquez sur l'un des trois boutons dans le coin supérieur droit, en fonction de la discipline de champion que vous souhaitez enregistrer (|t28:28:esoui/art/champion/champion_points_magicka_icon-hud-32.dds|t, |t28:28:esoui/art/champion/champion_points_health_icon-hud-32.dds|t, |t28:28:esoui/art/champion/champion_points_stamina_icon-hud-32.dds|t).\n2. Choisissez si vous souhaitez enregistrer vos points de champion uniquement pour le personnage actuel ou pour l'ensemble du compte ou si le profil doit contenir toute la discipline de champion ou uniquement la barre de champion active.\n3. Au lieu de créer vos propres profils, vous pouvez également charger des préréglages inclus dans l'addon  ." 
	L.CSPS_Help_Head6 = "Automatisation de la barre Champion" 
	L.CSPS_Help_Sect6 = "1. Créez d'abord des profils pour vos barres de champion (lisez 'Points de champion en général' pour plus d'informations).\n2. Cliquez sur 'Options'. (|t28:28:esoui/art/skillsadvisor/advisor_tabicon_settings_up.dds|t)\n3. Cliquez sur 'Gérer les barres de champion'.\n4. Utilisez les flèches en haut |t28:28:esoui/art/buttons/large_leftarrow_up.dds|t ou |t28:28:esoui/art/buttons/large_rightarrow_up.dds|t pour choisir un groupe (il y a 20 groupes à remplir avec des profils). Chaque groupe peut se voir attribuer un raccourci clavier via les paramètres de contrôle .\n5. Les barres de champion sélectionnées peuvent maintenant être chargées et appliquées via la combinaison de touches définie ou via l'une des options d'automatisation expliquées dans les sections suivantes."
	L.CSPS_Help_Head7 = "Lier à des emplacements"
	L.CSPS_Help_Sect7 = "Dans le gestionnaire de la barre de champion, vous pouvez choisir si un groupe de barres de champion doit être appliqué une fois que vous entrez dans un certain emplacement, par exemple une épreuve ou une arène spécifique .\n	1. Cliquez sur 'Emplacement'.\n  2. Choisissez l'emplacement, où le groupe actuel doit être appliqué automatiquement, par exemple «Sollance» . \n 3. Cliquez sur 'Appliquer'.\nMaintenant, l'addon chargera les profils sélectionnés à chaque fois que vous entrerez dans Sollance."
	L.CSPS_Help_Head8 = "Dressing Room/Alpha Gear"
	L.CSPS_Help_Sect8 = "Vous pouvez également lier les profils de la barre de champion à Dressing Room ou Alpha Gear en utilisant le gestionnaire de barre de champion.\n1. Cliquer sur 'Dressing Room' ou 'Alpha Gear'.\n2. Choisissez un équipement / un ensemble de compétences auquel vous souhaitez associer votre profil de barre de champion.\n3. Cliquez sur 'Appliquer'. \ Maintenant chaque fois que vous équipez l'équipement / les compétences sélectionnés via dressing room ou Alpha Gear, la barre de champion liée sera également équipé."
	L.CSPS_Help_Head9 = "Icônes PC personnalisées"
	L.CSPS_Help_Sect9 = "Pour rendre les emplacements de champion plus faciles à distinguer, l'addon peut utiliser différentes icônes pour chaque compétence à créneaux. Cliquez sur 'Options' (coin supérieur droit , |t28:28:esoui/art/skillsadvisor/advisor_tabicon_settings_up.dds|t) et cochez la case 'Icônes PC personnalisées'."
	L.CSPS_Help_Head10 = "Barre de champion séparée"
	L.CSPS_Help_Sect10 = "L'addon peut afficher vos compétences de champion dans une barre séparée dans le cadre de la superposition en jeu, pour vous aider à garder une trace de celles qui sont actuellement actives. Cliquez sur 'Options' (top right corner, |t28:28:esoui/art/skillsadvisor/advisor_tabicon_settings_up.dds|t) et cochez la case «Barre PC séparée». Ici, vous pouvez également choisir si les emplacements doivent être affichés sur une seule ligne (1x12), sur trois lignes (3x4) ou si seules les compétences de l'arbre d'artisanat doivent être affichées (1x4) ."
	L.CSPS_Help_Oversection11 = "Import/\nExport"
	L.CSPS_Help_Head11 = "Import / Export en général"
	L.CSPS_Help_Sect11 = "1. Cliquez sur 'Options'. (|t28:28:esoui/art/skillsadvisor/advisor_tabicon_settings_up.dds|t)\n2. Cliquez sur 'Importer / Exporter'. La fenêtre d'importation / exportation s'ouvre.\n3. Utilisez le menu déroulant dans le coin supérieur droit pour choisir les données et le format que vous souhaitez importer et / ou exporter. \n4. En fonction du format choisi, vous disposez désormais de différentes options. \n5. Pour importer des données, vous devez d'abord les copier dans le presse-papiers, puis les coller dans le champ de texte d'importation  (Ctrl+V)."
	L.CSPS_Help_Head12 = "Importation de points de champion basée sur du texte (1/3)"
	L.CSPS_Help_Sect12 = "1. Pour cette option, choisissez d'abord la discipline de champion que vous souhaitez importer. \n2. Le texte d'importation doit contenir les noms (anglais) des compétences de champion et les valeurs correspondantes sous forme de nombres. \n3. Le format standard est un nombre pour la valeur, suivi du nom de la compétence  (ex. '10 Tireless Discipline' ou '(10) → Tireless Discipline'). Vous pouvez changer cet ordre en cliquant sur la case à cocher en bas de la page. Veuillez noter que le texte ne doit pas contenir de chiffres à côté des points de champion réels (si vous importez depuis AlcastHQ, le texte peut contenir des plages de PC comme `` 0-120 '' - cliquez sur le bouton `` Nettoyer '' dans le coin inférieur droit pour éliminer ces )."
	L.CSPS_Help_Head13 = "Importation de points de champion basée sur du texte (2/3)"
	L.CSPS_Help_Sect13 = "4. Si le texte contient des compétences de champion slottables, l'addon les appliquera en commençant par le haut. Si vous souhaitez que seules certaines compétences soient attribuées, marquez-les dans le texte avec le mot-clé supplémentaire «emplacement». \n5. Si l'addon ne reconnaît pas un ou plusieurs noms de compétences, vous avez la possibilité de les choisir manuellement dans la liste. Le processus ne sera pas terminé tant que toutes les valeurs n'auront pas été attribuées ou supprimées."
	L.CSPS_Help_Head14 = "Importation de points de champion basée sur du texte (3/3)"
	L.CSPS_Help_Sect14 = "Si votre texte contient plusieurs valeurs pour la même compétence de champion, seule la dernière valeur sera importée. Maintenez la touche Maj enfoncée tout en cliquant sur le bouton d’importation pour résumer ces valeurs à la place.\nUtilisez un clic droit pour créer un profil dynamique, puis maintenez la touche Ctrl enfoncée pour l’espace de gestion du compte. Les points de champion enregistrés dans un profil dynamique seront appliqués de haut en bas jusqu’à ce que le nombre maximum de points de champion actuellement disponibles soit atteint."
	L.CSPS_Help_Head15 = "Étape par étape - importation depuis AlcastHQ ou JustLootIt "
	L.CSPS_Help_Sect15 = "1. Cliquez sur l'icône CP bleue, rouge ou verte dans le coin supérieur droit (selon la couleur PC que vous souhaitez importer). \n2. Cliquez sur 'Importer à partir du texte' (Ctrl + V). \n3. Collez le texte du site Web dans le champ de texte d'importation. \n4. Assurez-vous que le mot 'emplacement' ne se trouve que derrière les compétences que vous souhaitez réellement attribuer. \n5. Cliquez sur 'Texte de nettoyage' en bas à droite. \n6. Cochez la case 'Ordre inverse' (car AlcastHQ ou JustLootIt répertorient le nom avant la valeur). \n7. Cliquez sur 'Importer du texte'. \n8. Les points sont maintenant chargés dans l'addon. Vous pouvez maintenant les enregistrer dans un nouveau profil en cliquant sur 'Personnalisé (Compte)' ou 'Personnalisé (Caractère)' puis sur le bouton plus, sous ces boutons, ou les appliquer en cliquant sur le bouton Appliquer sous la section Profil PC ."
	
	-- Dialogs
	L.CSPS_MSG_ConfirmSave = "Enregistrez les données affichées en tant que profil '<<1>>'? Cela écrasera les données existantes.<<2>>"
	L.CSPS_MSG_ConfirmApply = " Points de compétence disponibles: %s\nPoints de compétence réellement nécessaires: %s\n\nConflits: %s\nPas encore débloqué: %s\nDéjà sur un autre morph: %s\nClassement déjà plus élevé: %s\nMorph/rang pas encore débloqué: %s\n\nAppliquer ces compétences?"
	L.CSPS_MSG_ConfirmApplyTitle = "CSPS - Points de compétences"
	L.CSPS_MSG_ConfirmAttrTitle = "CSPS - Points d'attribut"
	L.CSPS_MSG_ConfirmAttr = "Points d'attribut nécessaires: <<1>>\nPoints d'attribut disponibles: <<2>>\nAppliquer ces points d'attribut?"
	L.CSPS_MSG_ConfirmAttr1 = "Impossible d'appliquer des points d'attribut; pas assez de points disponibles. Veuillez d'abord réinitialiser vos anciens points d'attribut."
	L.CSPS_MSG_ConfirmAttr2 = "Impossible d'appliquer des points d'attribut; au moins un attribut est déjà défini plus haut que la valeur prévue. Veuillez d'abord réinitialiser vos anciens points d'attribut ."
	L.CSPS_MSG_RenameProfile = "Choisissez un nouveau nom pour le profil '<<1>>':<<2>>"
	L.CSPS_MSG_DeleteProfile = "Supprimer vraiment le profil ? '<<1>>'?<<2>><<3>>"
	L.CSPS_MSG_DeleteProfileStan =  "Le profil standard sera chargé à la place."
	L.CSPS_MSG__ChangeProfile = "Profil '<<1>>' peut contenir des modifications non enregistrées. Voulez-vous vraiment charger le profil  '<<2>>'?<<3>>"
	L.CSPS_MSG_DeleteSkillType = "Voulez-vous vraiment supprimer toutes les compétences de '<<1>>' de votre profil ?" -- <<1>> peut être un type de compétence ou une ligne de compétences 
	L.CSPS_MSG_CpPurchTitle = "Appliquer des points de champion..."
	L.CSPS_MSG_CpPurchChosen = "Points requis: "
	L.CSPS_MSG_CpPurchCost = "Coûts: <<1>>|t28:28:esoui/art/loot/icon_goldcoin_pressed.dds|t" -- le coût et une icône de pièce de monnaie
	L.CSPS_MSG_CpPurchNow = "Voulez-vous appliquer les points de champion sélectionnés maintenant ?"
	L.CSPS_MSG_CpPurchFailed = "Échec de l'application des points de champion."
	L.CSPS_MSG_CpPurchSuccess = "Points de champion appliqués avec succès."
	L.CSPS_MSG_CpPointsMissing = "Vous n'avez pas assez de points de champion - supprimez des points et réessayez."	
	L.CSPS_MSG_Unslotted = "Les compétences suivantes ne peuvent pas être attribuées :"
	L.CSPS_MSG_NoCPProfiles = "\n\n|cff7723WARNING!|r\nCe n'est pas la meilleure façon de sauvegarder les profils des champions! Si vous souhaitez enregistrer un profil pour les points de champion uniquement, utilisez les trois boutons dans le coin supérieur droit pour ouvrir la section de profil de champion. Vous y trouverez des boutons séparés pour créer et enregistrer des profils . (|t28:28:esoui/art/champion/champion_points_magicka_icon-hud-32.dds|t, |t28:28:esoui/art/champion/champion_points_health_icon-hud-32.dds|t, |t28:28:esoui/art/champion/champion_points_stamina_icon-hud-32.dds|t)"
	L.CSPS_MSG_CPPaths = "Le chemin les moins chers à débloquer '<<C:1>>':\n\n<<2>>"
	L.CSPS_MSG_CPPathOpt = "|c<<1>>Option <<2>> (<<3>>)|r:" -- 1 Couleur 2 numéro 3 points
	L.CSPS_MSG_ExpTextLang = "Si la langue actuelle du jeu n'est pas l'anglais, vous ne pourrez pas importer cette liste plus tard. Souhaitez-vous utiliser à la place des noms de compétences normalisés compatibles avec l'importation ?"
	
	--	Errorcodes
	L.CSPS_ErrorNumber1 = "La compétence a déjà été apprise."
	L.CSPS_ErrorNumber2 = "La compétence est déjà sur une autre évolution. Veuillez réinitialiser vos compétences / évolutions avant d'essayer d'en appliquer de nouvelles ."
	L.CSPS_ErrorNumber3 = "Le rang actuel de cette compétence est déjà supérieur à celui que vous essayez d'appliquer."
	L.CSPS_LoadingError = "Veuillez vérifier la compétence: <<C:1>>"
	
	-- Options
	L.CSPS_ShowHb = "Affiche barre de raccourcis"
	L.CSPS_CPAutoOpen = "Ouvrir avec fenêtre PC"
	L.CSPS_CPCustomBar = "Barre de PC séparée"
	L.CSPS_CPCustomIcons = "Icônes PC personnalisées"
	L.CSPS_CPCustomBarLayout = "Disposition"
	
	-- Presets
	L.CSPS_MSG_SwitchCP = "Investissez des points dans |c<<1>>'<<2>>'|r au lieu de l'un des autres emplacements de barre de champion chaque fois que vous pourriez en profiter."
	L.CSPS_MSG_SituationalCP = "Envisagez de remplacer les emplacements de barre de champions par l'une des compétences suivantes en fonction de la situation:"
	
	-- Import/Export
	L.CSPS_ImpEx_BtnImpLink = "Importer le lien"
	L.CSPS_ImpEx_BtnImpText = "Importer du texte"
	L.CSPS_ImpEx_BtnExpLink = "Générer un lien"
	L.CSPS_ImpEx_BtnExpText = "Générer du texte"
	L.CSPS_ImpEx_Standard = "Vous pouvez soit coller un lien (Ctrl+V) a partir de eso-skillfactory.com pour importer une construction ou vous pouvez cliquer sur 'Générer un lien' pour générer un lien pour votre version actuelle sélectionnée à copier (Ctrl+C) et exporter dans votre navigateur et afficher sur eso-skillfactory.com."
	L.CSPS_ImpEx_CpAsText = "Vous pouvez coller une configuration PC sous forme de texte dans ce champ  (Ctrl+V). Le format standard est un nombre pour chaque valeur, suivi du nom de la compétence. Si le texte que vous souhaitez appliquer utilise un ordre différent, cliquez sur la case à cocher dans l'ordre inverse en bas. Si le texte contient des nombres pour les plages PC  (comme sur AlcastHQ ou JustLootIt), cliquez sur le bouton «Nettoyer» en bas pour les supprimer. Cliquez ensuite sur «Importer du texte». Tant que tout les noms de PC sont écrits complètement et correctement, l'addon les remplira automatiquement dans le tableau pour que vous puissiez les examiner et les appliquer. ."
	L.CSPS_ImpEx_BtnImpTT = "D'abord coller  (Ctrl+V) un lien dans le champ ci-dessous."
	L.CSPS_ImpEx_BtnExpTT = "Générer un lien à partir de votre version actuelle affichée."
	L.CSPS_ImpEx_NoData = "Aucune donnée disponible. Commencez par charger les données de votre personnage avant d'essayer de générer un lien ."
	L.CSPS_ImpEx_ErrHb = "Erreur lors de l'importation pour la barre de raccourcis <<1>>."
	L.CSPS_ImpEx_ErrSk = "La compétence n'a pas pu être mappée: <<1>>."
	L.CSPS_ImpExp_TextSk = "Exportation de texte: compétences"
	L.CSPS_ImpExp_TextOd = "Exportation de texte: autres données"
	L.CSPS_ImpEx_HbTxt = "Barre de raccourcis"
	L.CSPS_ImpEx_CsvCP = "Séparées par des virgules liste PC"
	L.CSPS_ImpEx_TxtCP2_1 = "PC |cA6D852(vert, à partir du texte)|r" 
	L.CSPS_ImpEx_TxtCP2_2 = "PC |c5CBDE7(bleu, à partir du texte)|r" 
	L.CSPS_ImpEx_TxtCP2_3 = "PC |cDE6531(rouge, à partir du texte)|r"
	L.CSPS_ImpExp_TxtOrder1 = "Valeur→Nom(/Slot)"
	L.CSPS_ImpExp_TxtOrder2 = "Nom(/Slot)→Valeur"
	L.CSPS_ImpExp_TxtOrder3 = "Nom→Valeur(→Slot)"
	L.CSPS_ImpEx_CapLabel = "Stop import quand nbre de points à dépenser atteint"
	L.CSPS_ImpExp_CleanUp = "Nettoyer le texte"
	L.CSPS_ImpExp_Transfer = "Transfert..."
	L.CSPS_ImpExp_TransferLoad = "Charge"
	L.CSPS_ImpExp_TransConfirm = "|cDE6531Souhaitez-vous vraiment transférer toutes les liaisons de <<1>> to <<2>>? Toutes les liaisons actuelles seront écrasées. Ce processus est irréversible.|r"
	L.CSPS_ImpExp_Transfer_Server = "Serveur"
	L.CSPS_ImpExp_Transfer_Profiles = "Profil..."
	L.CSPS_ImpExp_Transfer_CPP = "Profil de champion..."
	L.CSPS_ImpExp_Transfer_CPHb = "Barre de champion..."
	L.CSPS_ImpExp_Transfer_CopyReplace = "Transférer tous les profils et lien de barre de raccourcis (remplacer les profils actuels)"
	L.CSPS_ImpExp_Transfer_CopyAdd = "Transférer tous les profils et lien de barre de raccourcis (conserver les profils actuels)"
	
	L.CSPS_Tooltip_Transfer_CopyReplace = "|cDE6531All les liaisons et les profils de barre de raccourcis actuellement définis pour ce caractère seront écrasés.|r"
	L.CSPS_Tooltip_Transfer_CopyAdd = "Transférer les profils de barre de raccourcis mais conserver ceux existants.\n|cDE6531All les liaisons actuellement définies pour ce caractère seront écrasées.|r"
	
	L.CSPS_CPImp_Success = "Compétences mappées avec succès:"
	L.CSPS_CPImp_Unmapped = "Compétences non encore attribuées:"
	L.CSPS_CPImp_BtnApply = "Appliquer le mappage"
	L.CSPS_CPImp_BtnDiscard = "Supprimer"
	L.CSPS_CPImp_BtnDiscardAll = "Tout supprimer"
	L.CSPS_CPImp_New = "|c<<1>> <<2>>/<<3>> Mappée <<4>> vers points: <<C:5>>|r"
	L.CSPS_CPImp_Note = "Cliquez sur une compétence dans la liste ci-dessous pour la mapper manuellement. Veuillez noter que le mappage ne sera appliqué qu'une fois que toutes les compétences seront mappées ou supprimées ."
	L.CSPS_CPImp_NoMatch = "Impossible de trouver des données correspondantes."
	
for stringId, stringValue in pairs(L) do
	ZO_CreateStringId(stringId, stringValue)
end