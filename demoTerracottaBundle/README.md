
1.   �ړI�F  
	�O�ɊȒP��GroovyProject�ŁATerraCotta���g���܂����B  
	�ł�����AOSGI�V�X�e����TerraCotta���g���邩�ǂ����m�F���邽�߂ɁAMaven�@Project�Ƃ��āATerraCotta���g���Ă݂܂��B  

2.   �O������F  
	TerraCotta���g���邽�߂ɁATerraCotta�@Library���K�v�ł��B  
	TerraCottaOpen�\�[�X����擾�ł��܂��B�ȉ���Link���Q�Ƃ��Ă��������F  
		https://github.com/wiperdog/experimental/tree/master/terracotta  
	�R���́iquartz �Aehcache�Aterracotta�j��Built������A  
		Local Repository����TerraCotta�̕K�v��Library���擾�ł��܂��B  
			(pom�t�@�C���ɐݒ肳�����̂ł�)  

3.   �\�[�X�R�[�h��Built�F  
	�\�[�X�R�[�h�͈ȉ��̂��̂��܂݂܂��F   
		/pom.xml�F(TerraCotta�̕K�v��Library��ݒ肵�܂�)  
		/src/demoTerracottaBundle: �R�t�@�C��������܂��B���̒���  
			AJob.groovy: Quartz Job�@���@Implement����N���X   
			TerracottaConnect.groovy�FTerraCotta���g���āAJob���쐬���āA���s���܂��B  
	Built�F  
		/src/demoTerracottaBundle/TerracottaConnect.groovy�t�@�C����TerraCotta�T�[�o�̏����g���āA  
			org.quartz.jobStore.tcConfigUrl��ݒ肵����AMaven�R�}���h��Install���܂�: mvn clean install  
		Built���ꂽBundle��demoTerracottaOSGI�Ɏg���܂��BdemoTerracottaOSGI��README�t�@�C�����Q�Ƃ��Ă��������B  