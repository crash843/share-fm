all:
	cd frontend && npm install
	cd frontend && gulp

	cp -R frontend/build/* backend/share_fm/player/static/player