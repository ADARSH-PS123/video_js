import 'dart:developer';

import 'package:flutter/foundation.dart';

import 'package:universal_html/html.dart' as html;
import 'package:video_js_themed/src/models/videojs_options.dart';
import 'package:video_js_themed/src/web/video_js_scripts.dart';
import 'package:video_js_themed/src/web/video_results.dart';

class VideoJsController {
  final String playerId;
  final VideoJsOptions? videoJsOptions;
  final bool qualitySelector;

  VideoJsController(
    this.playerId, {
    this.videoJsOptions,
    this.qualitySelector = false,
  });

  /// This function is for initial a video.js instance with options
  videoJs(Function(String) onReady, {VideoJsOptions? videoJsOptions}) {
    final html.Element scriptElement = html.ScriptElement()
      ..id = "videojs"
      ..innerHtml =
          VideoJsScripts().videojsCode(playerId, videoJsOptions!.toJson());
    html.Element? ele = html.querySelector("#videojs");
    if (html.querySelector("#videojs") != null) {
      ele!.remove();
    }
    html.querySelector('body')!.children.add(scriptElement);
    VideoJsResults().listenToValueFromJs(playerId, 'onPlayerReady', onReady);
  }

  /// to set video source by type
  /// [type] can be video/mp4, video/webm, application/x-mpegURL (for hls videos), ...
  setSRC(String src, {required String type}) {
    final html.Element scriptElement = html.ScriptElement()
      ..id = "setSRC"
      ..innerHtml = VideoJsScripts().setSRCCode(playerId, src, type);
    html.Element? ele = html.querySelector("#setSRC");
    if (html.querySelector("#setSRC") != null) {
      ele!.remove();
    }
    html.querySelector('body')!.children.add(scriptElement);
  }

  /// To get volume of video
  getVolume(Function(String) onVolumeReceive) {
    final html.Element scriptElement = html.ScriptElement()
      ..id = "getVolume"
      ..innerHtml = VideoJsScripts().getVolume(playerId);
    html.Element? ele = html.querySelector("#getVolume");
    if (html.querySelector("#getVolume") != null) {
      ele!.remove();
    }
    html.querySelector('body')!.children.add(scriptElement);
    VideoJsResults()
        .listenToValueFromJs(playerId, 'getVolume', onVolumeReceive);
  }

  /// set volume to video player
  setVolume(String volume) {
    final html.Element scriptElement = html.ScriptElement()
      ..id = "setVolume"
      ..innerHtml = VideoJsScripts().setVolume(playerId, volume);
    html.Element? ele = html.querySelector("#setVolume");
    if (html.querySelector("#setVolume") != null) {
      ele!.remove();
    }
    html.querySelector('body')!.children.add(scriptElement);
  }

  /// toggle mute in video player. if player is mute, makes unmute and if is unmute makes mute
  toggleMute() {
    final html.Element scriptElement = html.ScriptElement()
      ..id = "toggleMute"
      ..innerHtml = VideoJsScripts().toggleMute(playerId);
    html.Element? ele = html.querySelector("#toggleMute");
    if (html.querySelector("#toggleMute") != null) {
      ele!.remove();
    }
    html.querySelector('body')!.children.add(scriptElement);
  }

  /// this function is for check video player mute status
  isMute(Function(String) onMuteStatus) {
    final html.Element scriptElement = html.ScriptElement()
      ..id = "isMute"
      ..innerHtml = VideoJsScripts().isMute(playerId);
    html.Element? ele = html.querySelector("#isMute");
    if (html.querySelector("#isMute") != null) {
      ele!.remove();
    }
    html.querySelector('body')!.children.add(scriptElement);
    VideoJsResults().listenToValueFromJs(playerId, 'isMute', onMuteStatus);
  }

  /// toggle full screen in video player. this function is different with requestFullScreen,
  /// this function just change type
  toggleFullScreen() {
    final html.Element scriptElement = html.ScriptElement()
      ..id = "toggleFullScreen"
      ..innerHtml = VideoJsScripts().toggleFullScreenMode(playerId);
    html.Element? ele = html.querySelector("#toggleFullScreen");

    if (html.querySelector("#toggleFullScreen") != null) {
      ele!.remove();
    }

    html.querySelector('body')!.children.add(scriptElement);
  }



  isFullScreenV2(Function(String) onFullScreenStatus) async {
    final html.Element scriptElement = html.ScriptElement()
      ..id = "isFullScreen"
      ..innerHtml = VideoJsScripts().isFullScreenV2(playerId);
    html.Element? ele = html.querySelector("#isFullScreen");
    if (html.querySelector("#isFullScreen") != null) {
      ele!.remove();
    }
    html.querySelector('body')!.children.add(scriptElement);
    VideoJsResults().isFullScreenV2((p0) {
      onFullScreenStatus(p0);
    });
  }

  /// To change player to full screen mode
  requestFullScreen() {
    final html.Element scriptElement = html.ScriptElement()
      ..id = "requestFullScreen"
      ..innerHtml = VideoJsScripts().requestFullscreen(playerId);
    html.Element? ele = html.querySelector("#requestFullScreen");
    if (html.querySelector("#requestFullScreen") != null) {
      ele!.remove();
    }
    html.querySelector('body')!.children.add(scriptElement);
  }

  /// To exit from full screen mode
  exitFullScreen() {
    final html.Element scriptElement = html.ScriptElement()
      ..id = "exitFullScreen"
      ..innerHtml = VideoJsScripts().exitFullscreen(playerId);
    html.Element? ele = html.querySelector("#exitFullScreen");
    if (html.querySelector("#exitFullScreen") != null) {
      ele!.remove();
    }
    html.querySelector('body')!.children.add(scriptElement);
  }

  /// play video
  play() {
    final html.Element scriptElement = html.ScriptElement()
      ..id = "play"
      ..innerHtml = VideoJsScripts().play(playerId);
    html.Element? ele = html.querySelector("#play");
    if (html.querySelector("#play") != null) {
      ele!.remove();
    }
    html.querySelector('body')!.children.add(scriptElement);
  }

  /// pause video
  pause() {
    final html.Element scriptElement = html.ScriptElement()
      ..id = "pause"
      ..innerHtml = VideoJsScripts().pause(playerId);
    html.Element? ele = html.querySelector("#pause");
    if (html.querySelector("#pause") != null) {
      ele!.remove();
    }
    html.querySelector('body')!.children.add(scriptElement);
  }

  /// To check video player pause status
  isPaused(Function(String) onPauseStatus) {
    final html.Element scriptElement = html.ScriptElement()
      ..id = "isPaused"
      ..innerHtml = VideoJsScripts().isPause(playerId);
    html.Element? ele = html.querySelector("#isPaused");
    if (html.querySelector("#isPaused") != null) {
      ele!.remove();
    }
    html.querySelector('body')!.children.add(scriptElement);
    VideoJsResults().listenToValueFromJs(playerId, 'isPaused', onPauseStatus);
  }

  /// Set video
  setCurrentTime(String currentTime) {
    final html.Element scriptElement = html.ScriptElement()
      ..id = "setCurrentTime"
      ..innerHtml = VideoJsScripts().setCurrentTime(playerId, currentTime);
    html.Element? ele = html.querySelector("#setCurrentTime");
    if (html.querySelector("#setCurrentTime") != null) {
      ele!.remove();
    }
    html.querySelector('body')!.children.add(scriptElement);
  }

  totalDurationV2(Function(String) fun) {
    final html.Element scriptElement = html.ScriptElement()
      ..id = "durationTime"
      ..innerHtml = VideoJsScripts().totalDurationV2(playerId);
    html.Element? ele = html.querySelector("#durationTime");
    if (html.querySelector("#durationTime") != null) {
      ele!.remove();
    }
    html.querySelector('body')!.children.add(scriptElement);
    VideoJsResults().totalDurationV2((p0) => fun(p0));
  }

  currentDurationV2(Function(String) fun) {
    final html.Element scriptElement = html.ScriptElement()
      ..id = "durationTime"
      ..innerHtml = VideoJsScripts().currentDurationV2(playerId);
    html.Element? ele = html.querySelector("#durationTime");
    if (html.querySelector("#durationTime") != null) {
      ele!.remove();
    }
    html.querySelector('body')!.children.add(scriptElement);
    VideoJsResults().currentDurationV2((p0) => fun(p0));
  }

  /// Video remain time in seconds
  remainTime(Function(String) onRemainTime) {
    final html.Element scriptElement = html.ScriptElement()
      ..id = "onRemainTime"
      ..innerHtml = VideoJsScripts().remainingTime(playerId);
    html.Element? ele = html.querySelector("#onRemainTime");
    if (html.querySelector("#onRemainTime") != null) {
      ele!.remove();
    }
    html.querySelector('body')!.children.add(scriptElement);
    VideoJsResults()
        .listenToValueFromJs(playerId, 'getRemaining', onRemainTime);
  }

  /// Video buffered ( downloaded ) percent
  bufferPercent(Function(String) onBufferPercent) {
    final html.Element scriptElement = html.ScriptElement()
      ..id = "bufferPercent"
      ..innerHtml = VideoJsScripts().bufferedPercent(playerId);
    html.Element? ele = html.querySelector("#bufferPercent");
    if (html.querySelector("#bufferPercent") != null) {
      ele!.remove();
    }
    html.querySelector('body')!.children.add(scriptElement);
    VideoJsResults()
        .listenToValueFromJs(playerId, 'getBuffered', onBufferPercent);
  }

  /// Set Video poster/thumbnail
  setPoster(String poster) {
    final html.Element scriptElement = html.ScriptElement()
      ..id = "setPoster"
      ..innerHtml = VideoJsScripts().setPoster(playerId, poster);
    html.Element? ele = html.querySelector("#setPoster");
    if (html.querySelector("#setPoster") != null) {
      ele!.remove();
    }
    html.querySelector('body')!.children.add(scriptElement);
  }

  /// Get Video poster/thumbnail
  getPoster(Function(String) onPosterGet) {
    final html.Element scriptElement = html.ScriptElement()
      ..id = "getPoster"
      ..innerHtml = VideoJsScripts().getPoster(playerId);
    html.Element? ele = html.querySelector("#getPoster");
    if (html.querySelector("#getPoster") != null) {
      ele!.remove();
    }
    html.querySelector('body')!.children.add(scriptElement);
    VideoJsResults().listenToValueFromJs(playerId, 'getPoster', onPosterGet);
  }

  isPlayerReady(Function(String) isReady) {
    final html.Element scriptElement = html.ScriptElement()
      ..id = "isReady"
      ..innerHtml = VideoJsScripts().isReady(playerId);
    html.Element? ele = html.querySelector("#isReady");
    if (html.querySelector("#isReady") != null) {
      ele!.remove();
    }
    html.querySelector('body')!.children.add(scriptElement);
    VideoJsResults().listenToValueFromJs(playerId, 'isPlayerReady', isReady);
  }

  /// Add callback to be triggered on playback start
  onPlay(Function(String) onPlay) {
    final html.Element scriptElement = html.ScriptElement()
      ..id = "onPlay"
      ..innerHtml = VideoJsScripts().onPlay(playerId);
    html.Element? ele = html.querySelector("#onPlay");
    if (html.querySelector("#onPlay") != null) {
      ele!.remove();
    }
    html.querySelector('body')!.children.add(scriptElement);
    VideoJsResults().listenToValueFromJs(playerId, 'onPlay', onPlay);
  }

  /// Add callback to be triggered on playback end
  onEnd(Function(String) onEnd) {
    final html.Element scriptElement = html.ScriptElement()
      ..id = "onEnd"
      ..innerHtml = VideoJsScripts().onEnd(playerId);
    html.Element? ele = html.querySelector("#onEnd");
    if (html.querySelector("#onEnd") != null) {
      ele!.remove();
    }
    html.querySelector('body')!.children.add(scriptElement);
    VideoJsResults().listenToValueFromJs(playerId, 'onEnd', onEnd);
  }

  /// This method is available on all Video.js players and components.
  /// It is the only supported method of removing a Video.js player from both the DOM and memory.
  dispose() {
    final html.Element scriptElement = html.ScriptElement()
      ..id = "dispose"
      ..innerHtml = VideoJsScripts().dispose(playerId);
    html.Element? ele = html.querySelector("#dispose");
    if (html.querySelector("#dispose") != null) {
      ele!.remove();
    }
    html.querySelector('body')!.children.add(scriptElement);

    if (kDebugMode) {
      log('VideoJsController disposed');
    }
  }
}
