    
1. �ړI�F    
	�O�ɊȒP��GroovyProject�ŁATerraCotta���g���܂����B    
	�ł�����AOSGI�V�X�e����TerraCotta���g���邩�ǂ����m�F���邽�߂ɁA    
	TerraCotta���g���āAMaven�@Project�Ƃ���Built������AOSGI�V�X�e���̒��Ɏ��s���Ă݂܂��B    
2. �O������F    
	demoTerracottaBundle��Built����Bundle���g���܂�����A�܂��AdemoTerracottaBundle��README���Q�Ƃ��āABuilt����B    
		Built�������ʁi�K�v�Ȑݒ�����C��������j��demoTerracottaOSGI\lib\java\bundle�ɒu��    
	���s�̂��߂ɁATerraCotta�T�[�o���K�v�ł�����ATerraCottaOpen�\�[�X���擾�ł��܂��B�ȉ���Link���Q�Ƃ��āABuilt����    
		https://github.com/wiperdog/experimental/tree/master/terracotta    
		Built������ASVN����terracotta�擾����Folder/deploy�ňȉ���Command��Terracotta�T�[�o���N���ł��܂��B    
			maven exec:exec -P start-server    
			(��~���鎞�Amaven exec:exec -P stop-server���g���܂�)    
	Quartz bundle��TerraCotta�̕K�v��Library�ƃ}�[�W���Ȃ���ȂȂ�܂���B�idemoTerracottaOSGI\lib\java\bundle\quartz-2.2.1.jar�j    
		�}�[�W�������̂�demoTerracottaOSGI\lib\java\bundle\quartz-new-merge.txt���Q�Ƃ��Ă��������B    
		�K�v��Library��TerraCottaOpen�\�[�X��Built������ALocal repository����擾�ł��܂��B    
		�i�ꎞ�A�K�v��Library��Extract���āA��A�S��Jar�t�@�C���Ƃ���Zip���܂��j    
	Lib��Bundle�̂��߂�/install/listBundle.txt��ύX���āAprocessBundle��Script�����s���Ȃ���΂Ȃ�܂���B
3. ���s�F    
	Wiperdog�̊����ȒP�ɂ��āA����OSGI�����쐬���܂����B    
	demoTerracottaOSGI\bin�̒��ɁAstartWiperdog.sh/startWiperdog.bat�����s���Ă��������B    
	���s����Ƃ��AdemoTerracottaBundle��Built����Bundle�����s�ł��܂�����AOSGI�V�X�e���̒���TerraCotta���g���邱�Ƃ������܂��B   