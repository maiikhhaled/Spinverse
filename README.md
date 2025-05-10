# Spinverse

**Spinverse** is a simple iOS app that combines SwiftUI and SceneKit to display a 3D Earth that users can control by touch.

The Earth model was created using Reality Composer, and integrated into the app using SceneKit. The user can rotate the planet directly with one finger, and the app applies a smooth inertia effect so the motion feels more natural.

---

## Features

- 3D Earth model built in Reality Composer  
- Direct touch rotation using pan gestures  
- Inertia-based motion after release  
- SceneKit rendering inside SwiftUI using `UIViewRepresentable`  
- Space-inspired background

---

## Demo

https://github.com/user-attachments/assets/56ee7057-18d0-4fb5-80a7-205a135601e7

> In this short demo, you can see how the Earth responds to finger gestures.  
> When the user swipes across the screen, the planet rotates in real-time, following the motion of their finger.  
> After releasing the finger, the Earth keeps spinning with a smooth inertia effect — creating a natural, physics-like interaction.

---

## Screenshot

<img src="https://github.com/user-attachments/assets/8ddccb36-293a-4367-a7cc-c2eadab9342d" alt="earth" width="300"/>

> A still view of the 3D Earth rendered with SceneKit inside SwiftUI.  
> The background simulates space, and the globe can be interacted with directly using touch.

---

## Why I built this

The goal was to learn how to integrate 3D objects and touch interaction in a SwiftUI app.  
This project focuses on building a smooth, responsive 3D interaction using native Apple tools like SceneKit and SwiftUI, along with gesture handling.

---

## Technologies Used

- Swift  
- SwiftUI  
- SceneKit  
- Reality Composer  
- UIKit (`UIViewRepresentable`)  
- Xcode
