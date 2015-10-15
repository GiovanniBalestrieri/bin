
(cl:in-package :asdf)

(defsystem "atrv_tv-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :sensor_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "BatteryState" :depends-on ("_package_BatteryState"))
    (:file "_package_BatteryState" :depends-on ("_package"))
    (:file "RangeArray" :depends-on ("_package_RangeArray"))
    (:file "_package_RangeArray" :depends-on ("_package"))
  ))