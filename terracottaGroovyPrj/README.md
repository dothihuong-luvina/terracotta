
1. �ړI�F    
	�O��TerraCotta�ɂ��Ē������܂������A������Wiperdog�ɓK�p���āA���ʂ��Ȃ������ł��B    
	�ł�����A�ȒP����TerraCotta���g���邩�ǂ����m�F���邽�߂ɁA�ȒP��GroovyProject�Ƃ��āATerraCotta���g���Ă݂܂��B  
  
2. �O������F    
	TerraCotta���g���邽�߂ɁA�ȉ��̂Q���̂��K�v�ł��F    
		TerraCotta�@Library    
		TerraCotta�@�T�[�o    
	TerraCottaOpen�\�[�X����擾�ł��܂��B�ȉ���Link���Q�Ƃ��Ă��������F    
		https://github.com/wiperdog/experimental/tree/master/terracotta    
	�R���́iquartz �Aehcache�Aterracotta�j��Built������A    
		Local Repository����TerraCotta�̕K�v��Library���擾�ł��܂��B    
			(terracottaGroovyPrj\lib�ɒu�����̂ł�)    
		SVN����terracotta�擾����Folder/deploy�ňȉ���Command��Terracotta�T�[�o���N���ł��܂��B    
			maven exec:exec -P start-server    
			(��~���鎞�Amaven exec:exec -P stop-server���g���܂�)    

3. �\�[�X�R�[�h�Ǝ��s�F    
	�\�[�X�R�[�h�͈ȉ��̂��̂��܂݂܂��F    
		/lib�FLibrary jar (�قƂ��TerraCotta��Library)    
		/src: testTerracotta.groovy�t�@�C��������܂��B���̃t�@�C���̒���TerraCotta���g���āAJob���쐬���āA���s���܂��B    
	���s�F    
		/src/testTerracotta.groovy�t�@�C����TerraCotta�T�[�o�̏����g���āAorg.quartz.jobStore.tcConfigUrl��ݒ肵����A    
		���̃t�@�C����Run As/Groovy Script�Ŏ��s�ł��܂��B    
		Process��Terracotta�T�[�o���N���ł����܂ő҂��܂��B

