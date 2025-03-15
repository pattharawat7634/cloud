# # ======== BASE IMAGE FOR BACKEND (Flask API) ========
# FROM python:3.9 AS backend

# WORKDIR /app

# # ✅ ติดตั้ง tkinter และ dependencies ผ่าน `apt` (ถ้าไม่ได้ใช้ GUI สามารถลบได้)
# RUN apt-get update && apt-get install -y python3-tk

# # ✅ Copy และติดตั้ง dependencies
# COPY requirements.txt .
# RUN pip install --no-cache-dir -r requirements.txt

# # ✅ Copy Backend Code
# COPY backend/ ./backend

# # ✅ Expose port 8000 สำหรับ Flask API
# EXPOSE 8000

# # ✅ ใช้ Python รัน Flask API
# CMD ["python", "backend/face_api.py"]



# ======== BASE IMAGE FOR FRONTEND (React UI) ========
FROM node:18 AS frontend  

WORKDIR /app/frontend

# ✅ Copy package.json และ package-lock.json
COPY frontend/package.json frontend/package-lock.json ./

# ✅ ติดตั้ง dependencies ของ React
RUN npm install

# ✅ Copy โค้ดของ frontend ทั้งหมด
COPY frontend/src ./src
COPY frontend/public ./public
  # ✅ ต้อง COPY public/

# ✅ Expose port 3000 สำหรับ React
EXPOSE 3000

# ✅ รัน React ด้วย `npm start` (สำหรับ Dev Mode)
CMD ["npm", "start"]
